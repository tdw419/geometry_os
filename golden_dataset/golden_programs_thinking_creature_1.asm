; DESCRIPTION: This GeOS assembly code implements a simple world where a red creature wanders. The creature's movement is planned in intervals of up to 15 steps, after which it queries a Large Language Model (LLM) for a new direction (N, S, E, W). The game includes player control via arrow keys to move the camera/viewport, and renders a grid-based world with different biomes.

; thinking_creature.asm -- One LLM-driven creature on a simple world
;
; A red creature wanders the map. Every ~15 moves its plan runs out and it
; calls the LLM opcode to pick a fresh direction (N, S, E, or W). The game
; freezes briefly while the LLM responds -- that's expected, LLM is blocking.
;
; Controls: arrow keys move the white player (viewport center).
;
; Memory:
;   0x7000 creature world_x
;   0x7001 creature world_y
;   0x7002 plan_dir   (0=up, 1=down, 2=left, 3=right)
;   0x7003 plan_steps (countdown; 0 -> call LLM)
;   0x7800 camera_x
;   0x7801 camera_y
;   0x7802 frame_counter
;   0xB000 LLM prompt buffer
;   0xC000 LLM response buffer
;   0xFFB  key bitmask

; ===== Constants in registers =====
LDI r3, 1                ; the ubiquitous +1
LDI r5, 64               ; TILES per axis
LDI r1, 4                ; tile pixels
LDI r12, 0xFFB           ; key bitmask port
LDI r4, 0x7800          ; camera_x addr
LDI r8, 0x7801          ; camera_y addr
LDI r0, 0x7802          ; frame_counter addr
LDI r28, 32              ; viewport center

; ===== Write prompt string once to 0xB000 =====
LDI r17, 0xB000
STRO r17, "Pick one direction. Reply with a single letter: N, S, E, or W."

; ===== Init creature at (34, 33) =====
LDI r17, 0x7000
LDI r18, 34
STORE r17, r18           ; creature_x
LDI r17, 0x7001
LDI r18, 33
STORE r17, r18           ; creature_y
LDI r17, 0x7002
LDI r18, 0
STORE r17, r18           ; plan_dir = 0 (up)
LDI r17, 0x7003
LDI r18, 0
STORE r17, r18           ; plan_steps = 0 -> will trigger LLM on first update

; ===== Init camera at (0, 0) so player starts at world (32, 32) =====
LDI r17, 0
STORE r4, r17
STORE r8, r17
STORE r0, r17           ; frame_counter = 0

main_loop:
LDI r28, 32              ; reload center (clobbered by subroutines)

; --- Increment frame counter ---
LOAD r17, r0
ADD r17, r3
STORE r0, r17

; --- Read camera ---
LOAD r14, r4            ; camera_x
LOAD r11, r8            ; camera_y

; --- Read keys ---
LOAD r16, r12            ; key bitmask

; Up (bit 0)
MOV r17, r16
LDI r18, 1
AND r17, r18
JZ r17, no_up
SUB r11, r3
no_up:

; Down (bit 1)
MOV r17, r16
LDI r18, 2
AND r17, r18
JZ r17, no_down
ADD r11, r3
no_down:

; Left (bit 2)
MOV r17, r16
LDI r18, 4
AND r17, r18
JZ r17, no_left
SUB r14, r3
no_left:

; Right (bit 3)
MOV r17, r16
LDI r18, 8
AND r17, r18
JZ r17, no_right
ADD r14, r3
no_right:

STORE r4, r14
STORE r8, r11

; ===== Update creature (every 8 frames) =====
LOAD r22, r0
LDI r17, 7
AND r22, r17
JNZ r22, skip_creature

; plan_steps == 0? -> call LLM
LDI r17, 0x7003
LOAD r18, r17            ; r18 = plan_steps
JNZ r18, do_move

CALL think_creature
JMP skip_creature        ; don't also move this tick

do_move:
CALL move_creature

skip_creature:

; ===== Render =====
LDI r17, 0
FILL r17

; Tile grid
LOAD r22, r0            ; frame_counter for animation
LDI r6, 0

render_y:
  LDI r13, 0
render_x:
    MOV r10, r14
    ADD r10, r13           ; world_x
    MOV r9, r11
    ADD r9, r6           ; world_y

    ; Hash for biome (coarse)
    MOV r2, r10
    LDI r18, 3
    SHR r2, r18
    LDI r18, 99001
    MUL r2, r18
    MOV r7, r9
    LDI r18, 3
    SHR r7, r18
    LDI r18, 79007
    MUL r7, r18
    XOR r2, r7
    LDI r18, 1103515245
    MUL r2, r18
    LDI r18, 28
    SHR r2, r18          ; biome 0..15

    LDI r18, 3
    CMP r2, r18
    BLT r15, tile_water
    LDI r18, 8
    CMP r2, r18
    BLT r15, tile_grass
    LDI r18, 12
    CMP r2, r18
    BLT r15, tile_forest
    JMP tile_rock

tile_water:
    LDI r17, 0x0055AA
    JMP tile_draw
tile_grass:
    LDI r17, 0x33AA22
    JMP tile_draw
tile_forest:
    LDI r17, 0x116600
    JMP tile_draw
tile_rock:
    LDI r17, 0x888888

tile_draw:
    MOV r10, r13
    MUL r10, r1
    MOV r9, r6
    MUL r9, r1
    RECTF r10, r9, r1, r1, r17

    ADD r13, r3
    MOV r18, r13
    SUB r18, r5
    JZ r18, next_row
    JMP render_x

next_row:
    ADD r6, r3
    MOV r18, r6
    SUB r18, r5
    JZ r18, render_done
    JMP render_y

render_done:

; --- Draw creature ---
LDI r17, 0x7000
LOAD r10, r17
LDI r17, 0x7001
LOAD r9, r17
LDI r17, 0xFF3322        ; bright red
CALL draw_entity

; --- Draw player at viewport center ---
LDI r10, 128
LDI r9, 128
LDI r17, 0xFFFFFF
RECTF r10, r9, r1, r1, r17

FRAME
JMP main_loop


; ===== Subroutine: move_creature =====
; Steps the creature one tile in its plan_dir, then plan_steps--.
; Clobbers: r10, r9, r17, r18
move_creature:
  LDI r17, 0x7000
  LOAD r10, r17           ; world_x
  LDI r17, 0x7001
  LOAD r9, r17           ; world_y
  LDI r17, 0x7002
  LOAD r18, r17          ; plan_dir

  ; Branch on dir
  JZ r18, mv_up
  LDI r19, 1
  CMP r18, r19
  JZ r15, mv_down
  LDI r19, 2
  CMP r18, r19
  JZ r15, mv_left
  JMP mv_right

mv_up:
  SUB r9, r3
  JMP mv_write
mv_down:
  ADD r9, r3
  JMP mv_write
mv_left:
  SUB r10, r3
  JMP mv_write
mv_right:
  ADD r10, r3

mv_write:
  LDI r17, 0x7000
  STORE r17, r10
  LDI r17, 0x7001
  STORE r17, r9

  ; plan_steps--
  LDI r17, 0x7003
  LOAD r18, r17
  SUB r18, r3
  STORE r17, r18
  RET


; ===== Subroutine: think_creature =====
; Calls LLM, parses N/S/E/W from response, updates plan_dir + plan_steps.
; Falls back to a RAND direction if no recognizable letter appears.
think_creature:
  ; r_prompt, r_response, r_max
  LDI r10, 0xB000
  LDI r9, 0xC000
  LDI r2, 256
  LLM r10, r9, r2         ; r15 = response length

  ; Default: random direction if parse fails
  RAND r20
  LDI r18, 3
  AND r20, r18           ; r20 = 0..3

  ; Scan response buffer for first N/S/E/W letter
  LDI r21, 0xC000        ; cursor
  MOV r22, r15            ; remaining chars to scan
  JZ r22, tc_done        ; empty response -> keep random

tc_scan:
  LOAD r23, r21          ; char
  JZ r23, tc_done        ; null terminator -> stop

  LDI r18, 78            ; 'N'
  CMP r23, r18
  JZ r15, tc_pick_up
  LDI r18, 110           ; 'n'
  CMP r23, r18
  JZ r15, tc_pick_up

  LDI r18, 83            ; 'S'
  CMP r23, r18
  JZ r15, tc_pick_down
  LDI r18, 115           ; 's'
  CMP r23, r18
  JZ r15, tc_pick_down

  LDI r18, 69            ; 'E'
  CMP r23, r18
  JZ r15, tc_pick_right
  LDI r18, 101           ; 'e'
  CMP r23, r18
  JZ r15, tc_pick_right

  LDI r18, 87            ; 'W'
  CMP r23, r18
  JZ r15, tc_pick_left
  LDI r18, 119           ; 'w'
  CMP r23, r18
  JZ r15, tc_pick_left

  ADD r21, r3
  SUB r22, r3
  JNZ r22, tc_scan
  JMP tc_done

tc_pick_up:
  LDI r20, 0
  JMP tc_done
tc_pick_down:
  LDI r20, 1
  JMP tc_done
tc_pick_left:
  LDI r20, 2
  JMP tc_done
tc_pick_right:
  LDI r20, 3

tc_done:
  ; Commit plan_dir
  LDI r17, 0x7002
  STORE r17, r20
  ; plan_steps = 15
  LDI r17, 0x7003
  LDI r18, 15
  STORE r17, r18
  RET


; ===== Subroutine: draw_entity =====
; Draws a 4x4 rect at (world_x, world_y) in r10, r9 with color in r17 if on-screen.
; Clobbers: r10, r9, r2, r7, r18
draw_entity:
  LOAD r2, r4            ; camera_x
  MOV r7, r10
  SUB r7, r2              ; r7 = world_x - camera_x (wraps if negative)
  LDI r18, 64
  CMP r7, r18
  BGE r15, de_done
  MOV r10, r7
  LDI r18, 4
  MUL r10, r18             ; pixel x

  LOAD r2, r8            ; camera_y
  MOV r7, r9
  SUB r7, r2
  LDI r18, 64
  CMP r7, r18
  BGE r15, de_done
  MOV r9, r7
  LDI r18, 4
  MUL r9, r18             ; pixel y

  RECTF r10, r9, r1, r1, r17

de_done:
  RET
