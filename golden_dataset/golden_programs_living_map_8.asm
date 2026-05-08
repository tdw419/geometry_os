; DESCRIPTION: This GeOS assembly code implements a stateful infinite world with wandering creatures. The player is always at the viewport center, and footstep trails mark visited tiles as "path" color. Creatures wander via random walk and are drawn on top of terrain. Weather effects like rain, snow, and lightning are also simulated, with particle systems for visual effects.

; living_map.asm -- Stateful infinite world with wandering creatures
;
; Extends infinite_map.asm with:
;   Layer 1: Sparse state overlay (footstep trails)
;   Layer 3: Simulated creatures (wander AI, no SPAWN needed)
;
; Player is always at viewport center (tile 32,32).
; Footstep trails mark visited tiles as "path" color.
; Creatures wander the world via random walk, drawn on top of terrain.
;
; Memory:
;   RAM[0x7800] = camera_x (tile coordinates)
;   RAM[0x7801] = camera_y (tile coordinates)
;   RAM[0x7802] = frame_counter
;   RAM[0x7803] = player_world_x (camera_x + 32)
;   RAM[0x7804] = player_world_y (camera_y + 32)
;   RAM[0x7805] = prev_player_x (for detecting movement)
;   RAM[0x7806] = prev_player_y
;   RAM[0x7807] = state_count (number of state entries, 0..64)
;   RAM[0x7808] = state_head (circular buffer write index)
;   RAM[0x9000..0x92FF] = state table (64 entries * 3 words: world_x, world_y, color)
;   RAM[0x7000..0x7002] = creature 0 (world_x, world_y, dir_seed)
;   RAM[0x7004..0x7006] = creature 1
;   RAM[0x7008..0x700A] = creature 2
;   RAM[0xFFB]  = key bitmask (host writes each frame)

; ===== Constants =====
LDI r2, 1               ; constant 1
LDI r10, 64              ; TILES per axis
LDI r13, 4               ; TILE_SIZE pixels
LDI r4, 0xFFB          ; key bitmask port
LDI r11, 0x7800         ; camera_x address
LDI r1, 0x7801         ; camera_y address
LDI r12, 0x7802         ; frame_counter address
LDI r28, 32             ; center offset

; ===== Initialize state table =====
LDI r17, 0x7807
LDI r18, 0
STORE r17, r18          ; state_count = 0
LDI r17, 0x7808
STORE r17, r18          ; state_head = 0

; ===== Initialize weather =====
LDI r17, 0x7809
LDI r18, 0
STORE r17, r18          ; weather_state = 0 (clear)
LDI r17, 0x780A
LDI r18, 200
STORE r17, r18          ; weather_timer = 200
LDI r17, 0x780B
LDI r18, 60
STORE r17, r18          ; lightning_countdown = 60
LDI r17, 0x780C
LDI r18, 0
STORE r17, r18          ; lightning_flash = 0

; ===== Initialize rain particles (32 at 0x7010) =====
LDI r23, 0x7010
LDI r24, 32
init_rain:
  RAND r25
  LDI r18, 0xFF
  AND r25, r18
  STORE r23, r25          ; x = random 0..255
  ADD r23, r2
  RAND r25
  LDI r18, 0xFF
  AND r25, r18
  STORE r23, r25          ; y = random 0..255
  ADD r23, r2
  SUB r24, r2
  JNZ r24, init_rain

; ===== Initialize snow particles (32 at 0x7050) =====
LDI r23, 0x7050
LDI r24, 32
init_snow:
  RAND r25
  LDI r18, 0xFF
  AND r25, r18
  STORE r23, r25          ; x = random 0..255
  ADD r23, r2
  RAND r25
  LDI r18, 0xFF
  AND r25, r18
  STORE r23, r25          ; y = random 0..255
  ADD r23, r2
  SUB r24, r2
  JNZ r24, init_snow

; ===== Initialize player position =====
LDI r17, 0x7803
LDI r18, 32
STORE r17, r18          ; player_world_x = 32
LDI r17, 0x7804
STORE r17, r18          ; player_world_y = 32
LDI r17, 0x7805
STORE r17, r18          ; prev_player_x = 32
LDI r17, 0x7806
STORE r17, r18          ; prev_player_y = 32

; ===== Main Loop =====
main_loop:
LDI r28, 32             ; center offset (reloaded because r28 gets clobbered)

; --- Increment frame counter ---
LOAD r17, r12
ADD r17, r2
STORE r12, r17          ; frame_counter++

; --- Read camera position ---
LOAD r14, r11           ; r14 = camera_x
LOAD r6, r1           ; r6 = camera_y

; --- Read key bitmask ---
LOAD r16, r4           ; r16 = key bitmask

; --- Store previous player position ---
LDI r17, 0x7803
LOAD r18, r17
LDI r17, 0x7805
STORE r17, r18          ; prev_player_x = player_world_x
LDI r17, 0x7804
LOAD r18, r17
LDI r17, 0x7806
STORE r17, r18          ; prev_player_y = player_world_y

; --- Process Up (bit 0) ---
MOV r17, r16
LDI r18, 1
AND r17, r18
JZ r17, no_up
SUB r6, r2
no_up:

; --- Process Down (bit 1) ---
MOV r17, r16
LDI r18, 2
AND r17, r18
JZ r17, no_down
ADD r6, r2
no_down:

; --- Process Left (bit 2) ---
MOV r17, r16
LDI r18, 4
AND r17, r18
JZ r17, no_left
SUB r14, r2
no_left:

; --- Process Right (bit 3) ---
MOV r17, r16
LDI r18, 8
AND r17, r18
JZ r17, no_right
ADD r14, r2
no_right:

; --- Store updated camera ---
STORE r11, r14
STORE r1, r6

; --- Compute and store player world position ---
MOV r17, r14
ADD r17, r28
LDI r18, 0x7803
STORE r18, r17          ; player_world_x = camera_x + 32
MOV r17, r6
ADD r17, r28
LDI r18, 0x7804
STORE r18, r17          ; player_world_y = camera_y + 32

; --- Check if player moved, add footstep trail ---
LDI r17, 0x7803
LOAD r19, r17           ; r19 = player_world_x (current)
LDI r17, 0x7805
LOAD r18, r17           ; r18 = prev_player_x
CMP r19, r18
JNZ r7, add_footstep
LDI r17, 0x7804
LOAD r19, r17
LDI r17, 0x7806
LOAD r18, r17
CMP r19, r18
JZ r7, skip_footstep

add_footstep:
; Read prev position (tile we're leaving)
LDI r17, 0x7805
LOAD r20, r17           ; r20 = prev_player_x
LDI r17, 0x7806
LOAD r21, r17           ; r21 = prev_player_y

; Add to state table: state[state_head] = (x, y, path_color)
LDI r17, 0x7808
LOAD r22, r17           ; r22 = state_head
LDI r23, 0x9000         ; state table base
MOV r24, r22
LDI r25, 3
MUL r24, r25            ; r24 = head * 3
ADD r23, r24            ; r23 = &state[head][0]

STORE r23, r20          ; world_x
ADD r23, r2
STORE r23, r21          ; world_y
ADD r23, r2
LDI r25, 0xC2A280       ; path/dirt color
STORE r23, r25

; Advance head (circular, 64 entries)
ADD r22, r2
LDI r25, 64
MOV r26, r22
SUB r26, r25
JNZ r26, no_wrap
LDI r22, 0
no_wrap:
LDI r17, 0x7808
STORE r17, r22

; Update state_count (cap at 64)
LDI r17, 0x7807
LOAD r22, r17
ADD r22, r2
LDI r25, 64
MOV r26, r22
SUB r26, r25
JNZ r26, no_cap
LDI r22, 64
no_cap:
LDI r17, 0x7807
STORE r17, r22

skip_footstep:

; ===== Update Creatures (every 8th frame) =====
; Throttle: only move creatures when frame_counter & 7 == 0
LOAD r22, r12           ; r22 = frame_counter
LDI r17, 7
AND r22, r17
JNZ r22, skip_creatures

; --- Creature 0 at 0x7000 ---
LDI r23, 0x7000         ; creature 0 base
CALL update_creature

; --- Creature 1 at 0x7004 ---
LDI r23, 0x7004         ; creature 1 base
CALL update_creature

; --- Creature 2 at 0x7008 ---
LDI r23, 0x7008         ; creature 2 base
CALL update_creature

skip_creatures:

; ===== Update Weather =====
CALL weather_update

; --- Clear screen to black ---
LDI r17, 0
FILL r17

; ===== Render Viewport (terrain) =====
LOAD r22, r12           ; r22 = frame_counter
LDI r5, 0               ; ty = 0

render_y:
  LDI r9, 0             ; tx = 0

  render_x:
    ; World coordinates
    MOV r0, r14
    ADD r0, r9           ; r0 = world_x
    MOV r15, r6
    ADD r15, r5           ; r15 = world_y

    ; ---- Coarse hash for contiguous biomes ----
    MOV r8, r0
    LDI r18, 3
    SHR r8, r18
    LDI r18, 99001
    MUL r8, r18

    MOV r3, r15
    LDI r18, 3
    SHR r3, r18
    LDI r18, 79007
    MUL r3, r18

    XOR r8, r3

    LDI r18, 1103515245
    MUL r8, r18          ; mix

    LDI r18, 28
    SHR r8, r18          ; r8 = biome_type (0..15)

    ; ---- Fine hash for structure placement ----
    MOV r3, r0
    LDI r18, 374761393
    MUL r3, r18
    MOV r21, r15
    LDI r18, 668265263
    MUL r21, r18
    XOR r3, r21

    LDI r18, 0xFF
    MOV r21, r3
    AND r21, r18
    LDI r18, 42
    CMP r21, r18
    JNZ r7, no_struct

    LDI r18, 4
    CMP r8, r18
    BLT r7, struct_water
    LDI r18, 9
    CMP r8, r18
    BLT r7, struct_land
    LDI r18, 12
    CMP r8, r18
    BLT r7, struct_mountain
    JMP struct_snow

struct_water:
    LDI r17, 0x0066CC
    JMP do_rect
struct_land:
    LDI r17, 0x884422
    JMP do_rect
struct_mountain:
    LDI r17, 0xBBBBCC
    JMP do_rect
struct_snow:
    LDI r17, 0xAABBEE
    JMP do_rect

no_struct:
    ; ---- Biome -> Color ----
    LDI r18, 3
    CMP r8, r18
    BLT r7, color_water

    LDI r18, 4
    CMP r8, r18
    BLT r7, color_beach

    LDI r18, 7
    CMP r8, r18
    BLT r7, color_grass

    LDI r18, 9
    CMP r8, r18
    BLT r7, color_forest

    LDI r18, 12
    CMP r8, r18
    BLT r7, color_mountain

    JMP color_snow

color_water:
    LDI r18, 1
    CMP r8, r18
    BLT r7, water_deep
    LDI r18, 2
    CMP r8, r18
    JZ r7, water_shallow
    LDI r17, 0x000088
    JMP water_animate
water_deep:
    LDI r17, 0x000044
    JMP water_animate
water_shallow:
    LDI r17, 0x0000BB

water_animate:
    MOV r21, r22
    ADD r21, r0
    ADD r21, r15
    LDI r18, 0x1F
    AND r21, r18
    ADD r17, r21
    JMP do_rect

color_beach:
    LDI r17, 0xC2B280
    JMP do_rect

color_grass:
    LDI r18, 5
    CMP r8, r18
    BLT r7, grass_light
    LDI r18, 6
    CMP r8, r18
    JZ r7, grass_dark
    LDI r17, 0x33AA22
    JMP do_rect
grass_light:
    LDI r17, 0x55BB33
    JMP do_rect
grass_dark:
    LDI r17, 0x228811
    JMP do_rect

color_forest:
    LDI r18, 8
    CMP r8, r18
    JZ r7, forest_dense
    LDI r17, 0x116600
    JMP do_rect
forest_dense:
    LDI r17, 0x0A4400
    JMP do_rect

color_mountain:
    LDI r18, 10
    CMP r8, r18
    BLT r7, mt_low
    LDI r18, 11
    CMP r8, r18
    JZ r7, mt_tall
    LDI r17, 0x888888
    JMP do_rect
mt_low:
    LDI r17, 0x667766
    JMP do_rect
mt_tall:
    LDI r17, 0x999999
    JMP do_rect

color_snow:
    LDI r18, 14
    CMP r8, r18
    BLT r7, snow_light
    LDI r18, 15
    CMP r8, r18
    JZ r7, snow_peak
    LDI r17, 0xDDEEFF
    JMP do_rect
snow_light:
    LDI r17, 0xCCCCEE
    JMP do_rect
snow_peak:
    LDI r17, 0xFFFFFF
    JMP do_rect

    ; ---- Draw tile ----
do_rect:
    MOV r0, r9
    MUL r0, r13           ; r0 = tx * 4
    MOV r15, r5
    MUL r15, r13           ; r15 = ty * 4
    RECTF r0, r15, r13, r13, r17

    ; ---- Next tile ----
    ADD r9, r2
    MOV r18, r9
    SUB r18, r10
    JZ r18, next_row
    JMP render_x

next_row:
    ADD r5, r2
    MOV r18, r5
    SUB r18, r10
    JZ r18, render_state
    JMP render_y

; ===== Render State Overlay =====
render_state:
LDI r17, 0x7807
LOAD r20, r17           ; r20 = state_count
LDI r19, 0              ; entry index
LDI r23, 0x9000         ; state table base

state_loop:
  CMP r19, r20
  JNZ r7, state_check
  JMP state_done

state_check:
  MOV r24, r19
  LDI r25, 3
  MUL r24, r25
  MOV r26, r23
  ADD r26, r24

  LOAD r27, r26          ; world_x
  ADD r26, r2
  LOAD r28, r26          ; world_y
  ADD r26, r2
  LOAD r17, r26          ; color

  ; Check on-screen: camera_x <= world_x < camera_x + 64
  LOAD r0, r11           ; camera_x
  MOV r15, r27
  CMP r15, r0
  BLT r7, state_next

  MOV r15, r0
  ADD r15, r10
  MOV r0, r27
  CMP r0, r15
  BGE r7, state_next

  LOAD r0, r1           ; camera_y
  MOV r15, r28
  CMP r15, r0
  BLT r7, state_next

  MOV r15, r0
  ADD r15, r10
  MOV r0, r28
  CMP r0, r15
  BGE r7, state_next

  ; Compute screen position
  MOV r0, r27
  LOAD r15, r11
  SUB r0, r15
  LDI r25, 4
  MUL r0, r25

  MOV r15, r28
  LOAD r26, r1
  SUB r15, r26
  LDI r25, 4
  MUL r15, r25

  RECTF r0, r15, r13, r13, r17

state_next:
  ADD r19, r2
  JMP state_loop

state_done:

; ===== Render Creatures =====
; Creature 0 (orange-red)
LDI r17, 0x7000
LOAD r0, r17             ; world_x
LDI r17, 0x7001
LOAD r15, r17             ; world_y
LDI r17, 0xFF6633        ; orange-red
CALL draw_creature

; Creature 1 (gold)
LDI r17, 0x7004
LOAD r0, r17
LDI r17, 0x7005
LOAD r15, r17
LDI r17, 0xFFCC00        ; gold
CALL draw_creature

; Creature 2 (purple)
LDI r17, 0x7008
LOAD r0, r17
LDI r17, 0x7009
LOAD r15, r17
LDI r17, 0xCC33FF        ; purple
CALL draw_creature

; ===== Render Weather =====
CALL render_weather

; ===== Render Player =====
LDI r0, 128
LDI r15, 128
LDI r17, 0xFFFFFF        ; white
RECTF r0, r15, r13, r13, r17

; ===== End Frame =====
FRAME
JMP main_loop


; ===== Subroutine: update_creature =====
; Input: r23 = creature base address (world_x, world_y, dir_seed)
; Uses: r0-r3, r18-r21
; Clobbers: r7 (CMP), r0-r3, r18-r21
update_creature:
  PUSH r23
  PUSH r2

  LDI r2, 1

  ; Load position
  LOAD r0, r23           ; r0 = world_x
  LDI r18, 1
  ADD r23, r18
  LOAD r15, r23           ; r15 = world_y
  ADD r23, r18
  LOAD r8, r23           ; r8 = dir_seed

  ; Random direction
  RAND r3
  LDI r18, 3
  AND r3, r18            ; r3 = 0..3

  LDI r18, 1
  CMP r3, r18
  JZ r7, uc_down
  LDI r18, 2
  CMP r3, r18
  JZ r7, uc_left
  LDI r18, 3
  CMP r3, r18
  JZ r7, uc_right

uc_up:
  SUB r15, r2
  JMP uc_update
uc_down:
  ADD r15, r2
  JMP uc_update
uc_left:
  SUB r0, r2
  JMP uc_update
uc_right:
  ADD r0, r2

uc_update:
  ; Write back
  ; r23 currently points to dir_seed, need to reset to base
  POP r2
  POP r23
  STORE r23, r0           ; world_x
  LDI r18, 1
  ADD r23, r18
  STORE r23, r15           ; world_y
  ADD r23, r18
  ; Update seed with XOR for variety
  LDI r18, 2654435761     ; golden ratio constant
  XOR r8, r18
  STORE r23, r8           ; dir_seed

  RET


; ===== Subroutine: draw_creature =====
; Input: r0 = world_x, r15 = world_y, r17 = color
; Draws a 4x4 creature tile if on-screen
; Clobbers: r7, r0, r15, r8, r3, r18
draw_creature:
  ; Compute screen position: (world_x - camera_x) * 4
  LOAD r8, r11            ; camera_x
  ; Check: world_x < camera_x? (unsigned wrap = offscreen)
  MOV r3, r0
  SUB r3, r8              ; r3 = world_x - camera_x
  ; If world_x < camera_x, r3 wraps to huge number
  LDI r18, 64
  CMP r3, r18
  BGE r7, dc_done         ; off-screen right or wrapped left

  MOV r0, r3
  LDI r18, 4
  MUL r0, r18             ; pixel x

  LOAD r8, r1            ; camera_y
  MOV r3, r15
  SUB r3, r8
  CMP r3, r18             ; reuse r18=64 (still >= check)
  ; Actually r18 was overwritten to 4. Recompute.
  LDI r18, 64
  CMP r3, r18
  BGE r7, dc_done

  MOV r15, r3
  LDI r18, 4
  MUL r15, r18             ; pixel y

  RECTF r0, r15, r13, r13, r17

dc_done:
  RET


; ===== Subroutine: weather_update =====
; Updates weather state, moves particles, triggers lightning
; Uses: r17-r25 (all pushed/popped)
weather_update:
  PUSH r17
  PUSH r18
  PUSH r19
  PUSH r20
  PUSH r21
  PUSH r22
  PUSH r23
  PUSH r24
  PUSH r25

  ; r2 = 1 (constant, DO NOT MODIFY)

  ; --- Decrement weather timer ---
  LDI r17, 0x780A
  LOAD r18, r17
  SUB r18, r2
  STORE r17, r18            ; weather_timer--

  JNZ r18, wu_no_change

  ; --- Change weather ---
  RAND r18
  LDI r19, 3
  AND r18, r19              ; 0..3
  LDI r17, 0x7809
  STORE r17, r18            ; weather_state = random

  ; Reset timer: 150 + (rand & 0x7F) = 150..305
  RAND r19
  LDI r17, 0x7F
  AND r19, r17
  LDI r17, 150
  ADD r19, r17
  LDI r17, 0x780A
  STORE r17, r19

  ; Reset lightning countdown
  LDI r17, 0x780B
  RAND r18
  LDI r19, 0x3F
  AND r18, r19
  LDI r19, 40
  ADD r18, r19              ; 40..103
  STORE r17, r18

  ; Clear lightning flash
  LDI r17, 0x780C
  LDI r18, 0
  STORE r17, r18

wu_no_change:
  ; --- Read weather state ---
  LDI r17, 0x7809
  LOAD r20, r17             ; r20 = weather_state

  ; --- Update rain particles (rain=1 or storm=2) ---
  LDI r18, 1
  CMP r20, r18
  JZ r7, wu_do_rain
  LDI r18, 2
  CMP r20, r18
  JNZ r7, wu_skip_rain

wu_do_rain:
  LDI r21, 0x7010           ; rain particle base
  LDI r22, 32               ; count

wu_rain_loop:
  LOAD r23, r21             ; x
  ADD r21, r2               ; advance to y slot
  LOAD r24, r21             ; y

  ; Move y down by 2
  LDI r25, 2
  ADD r24, r25

  ; Check y >= 256 -> respawn
  LDI r17, 256
  CMP r24, r17
  BLT r7, wu_rain_ok

  RAND r23
  LDI r17, 0xFF
  AND r23, r17              ; new x = random
  LDI r24, 0                ; new y = 0

wu_rain_ok:
  STORE r21, r24            ; store y
  SUB r21, r2               ; back to x slot
  STORE r21, r23            ; store x
  ADD r21, r2               ; to y
  ADD r21, r2               ; to next particle x

  SUB r22, r2
  JNZ r22, wu_rain_loop

wu_skip_rain:

  ; --- Storm: lightning logic ---
  LDI r18, 2
  CMP r20, r18
  JNZ r7, wu_skip_lightning

  ; Decrement flash frames if active
  LDI r17, 0x780C
  LOAD r18, r17
  JZ r18, wu_no_flash
  SUB r18, r2
  STORE r17, r18            ; flash_frames--
  JMP wu_skip_lightning

wu_no_flash:
  ; Decrement lightning countdown
  LDI r17, 0x780B
  LOAD r18, r17
  SUB r18, r2
  STORE r17, r18            ; countdown--
  JNZ r18, wu_skip_lightning

  ; Trigger lightning bolt!
  LDI r17, 0x780C
  LDI r18, 3                ; visible for 3 frames
  STORE r17, r18
  ; Reset countdown
  LDI r17, 0x780B
  RAND r18
  LDI r19, 0x3F
  AND r18, r19
  LDI r19, 40
  ADD r18, r19
  STORE r17, r18

wu_skip_lightning:

  ; --- Snow: update snow particles (snow=3) ---
  LDI r18, 3
  CMP r20, r18
  JNZ r7, wu_skip_snow

  LDI r21, 0x7050           ; snow particle base
  LDI r22, 32               ; count

wu_snow_loop:
  LOAD r23, r21             ; x
  ADD r21, r2               ; to y slot
  LOAD r24, r21             ; y

  ; Move y down by 1
  ADD r24, r2

  ; Horizontal drift: random -1, 0, +1
  RAND r25
  LDI r17, 3
  AND r25, r17              ; 0..2
  LDI r17, 1
  SUB r25, r17              ; -1, 0, 1
  ADD r23, r25

  ; Wrap x to 0..255
  LDI r17, 0xFF
  AND r23, r17

  ; Check y >= 256 -> respawn
  LDI r17, 256
  CMP r24, r17
  BLT r7, wu_snow_ok

  RAND r23
  LDI r17, 0xFF
  AND r23, r17
  LDI r24, 0

wu_snow_ok:
  STORE r21, r24            ; store y
  SUB r21, r2               ; back to x
  STORE r21, r23            ; store x
  ADD r21, r2               ; to y
  ADD r21, r2               ; to next particle x

  SUB r22, r2
  JNZ r22, wu_snow_loop

wu_skip_snow:

  POP r25
  POP r24
  POP r23
  POP r22
  POP r21
  POP r20
  POP r19
  POP r18
  POP r17
  RET


; ===== Subroutine: render_weather =====
; Draws weather particles and lightning on screen
; Uses: r17-r25 (all pushed/popped)
render_weather:
  PUSH r17
  PUSH r18
  PUSH r19
  PUSH r20
  PUSH r21
  PUSH r22
  PUSH r23
  PUSH r24
  PUSH r25

  ; r2 = 1 (constant, DO NOT MODIFY)

  LDI r17, 0x7809
  LOAD r20, r17             ; r20 = weather_state

  ; --- Lightning bolt (storm, flash > 0) ---
  LDI r18, 2
  CMP r20, r18
  JNZ r7, rw_no_lightning

  LDI r17, 0x780C
  LOAD r18, r17             ; flash_frames
  JZ r18, rw_no_lightning

  ; Draw lightning bolt: LINE from near top-center to random bottom
  RAND r23
  LDI r17, 0xFF
  AND r23, r17              ; end_x = random 0..255
  LDI r21, 128              ; start_x = 128 (center)
  LDI r22, 0                ; start_y = top
  LDI r24, 180              ; end_y = 180
  LDI r25, 0xFFFFFF         ; white
  LINE r21, r22, r23, r24, r25

  ; Second branch from end of first bolt
  RAND r21
  LDI r17, 0xFE
  AND r21, r17              ; branch end_x
  LDI r22, 180              ; start_y of branch
  LDI r24, 240              ; end_y of branch
  LINE r23, r22, r21, r24, r25

rw_no_lightning:

  ; --- Rain particles (rain=1 or storm=2) ---
  LDI r18, 1
  CMP r20, r18
  JZ r7, rw_do_rain
  LDI r18, 2
  CMP r20, r18
  JNZ r7, rw_skip_rain

rw_do_rain:
  LDI r21, 0x7010
  LDI r22, 32

rw_rain_draw:
  LOAD r23, r21             ; x
  ADD r21, r2
  LOAD r24, r21             ; y

  LDI r17, 0x4488FF         ; light blue rain
  PSET r23, r24, r17

  ADD r21, r2               ; next particle
  SUB r22, r2
  JNZ r22, rw_rain_draw

rw_skip_rain:

  ; --- Snow particles (snow=3) ---
  LDI r18, 3
  CMP r20, r18
  JNZ r7, rw_skip_snow

  LDI r21, 0x7050
  LDI r22, 32

rw_snow_draw:
  LOAD r23, r21             ; x
  ADD r21, r2
  LOAD r24, r21             ; y

  LDI r17, 0xEEEEFF         ; light snowflake
  PSET r23, r24, r17

  ADD r21, r2               ; next particle
  SUB r22, r2
  JNZ r22, rw_snow_draw

rw_skip_snow:

  POP r25
  POP r24
  POP r23
  POP r22
  POP r21
  POP r20
  POP r19
  POP r18
  POP r17
  RET
