-- Copyright (C) 2007, 2010 - Bit-Blot
--
-- This file is part of Aquaria.
--
-- Aquaria is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- See the GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- studentA
function init()
	setupConversationEntity("")
	entity_initSkeletal("mer", "StudentA")
	entity_animate("idle", -1)
	entity_scale(0.7, 0.7)
	entity_setActivation(AT_CLICK, 80, 256)
	if isMapName("TrainingGrounds") then
		if getFlag("VedhaCave1") == 10 or getFlag("VedhaCave1") == 5 then
			entity_animate("practice", -1)
		else
			entity_delete()
		end
	end
end

function update(dt)
end

function enterState()
end

function exitState()
end

function activate()
	entity_flipHToAvatar()
	if isMapName("TrainingGrounds") then
		if getFlag("VedhaCave1")==10 then
			simpleConversation("StudentA_DraskMissing")
		else
			msg1("StudentA: no convo yet!")
		end
	end
end

