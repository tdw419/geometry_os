; maze_generator.asm -- DFS backtracking maze with animated generation + WASD player
;
; 16x16 maze, 4px per cell = 64x64 pixel maze area
; Centered on 256x256 screen at offset (96, 96)
;
; Memory layout:
;   0x7000..0x71FF  maze grid (256 u32 cells)
;     bit 0 = south wall present (1=wall)
;     bit 1 = east wall present (1=wall)
;     bit 8 = visited flag
;   0x7200..0x723F  DFS stack (32 entries * 2 words: x, y)
;   0x7240         stack pointer (number of entries on stack)
;   0x7241         gen_x (current cell x during generation)
;   0x7242         gen_y (current cell y during generation)
;   0x7243         state (0=generating, 1=playing)
;   0x7244         player_x
;   0x7245         player_y
;   0x7246         frame_count
;   0xFFB          key bitmask (host sets each frame)
;
; Register conventions:
;   r7  = constant 1
;   r20 = maze grid base (0x7000)
;   r21 = stack base (0x7200)
;   r22 = state vars base (0x7240)
;   r23 = key port (0xFFB)
;   r10 = temp / scratch
;   r11 = temp / scratch
;   r12 = temp / scratch
;   r13 = temp / scratch
;   r14 = wall color (0x181818)
;   r15 = passage color (0x227722)
;   r16 = player color (0xFF4444)
;   r17 = gen head color (0xFFFF00)
;   r18 = black (0x000000)
;   r19 = end goal color (0x4444FF)

; ===== INITIALIZATION =====

LDI r7, 1
LDI r20, 0x7000        ; maze grid
LDI r21, 0x7200        ; DFS stack
LDI r22, 0x7240        ; state vars
LDI r23, 0xFFB         ; key port

; Colors
LDI r14, 0x181818      ; wall
LDI r15, 0x227722      ; passage
LDI r16, 0xFF4444      ; player
LDI r17, 0xFFFF00      ; gen head
LDI r18, 0x000000      ; black
LDI r19, 0x4444FF      ; goal

; Clear maze grid to 0 (all walls, unvisited)
LDI r10, 0
LDI r11, 256
init_loop:
  MOV r12, r20
  ADD r12, r10
  LDI r13, 0
  STORE r12, r13
  ADD r10, r7
  CMP r10, r11
  BLT r0, init_loop

; Init state
LDI r10, 0x7243        ; state
LDI r13, 0
STORE r10, r13          ; state = generating

LDI r10, 0x7241        ; gen_x
STORE r10, r13          ; gen_x = 0

LDI r10, 0x7242        ; gen_y
STORE r10, r13          ; gen_y = 0

LDI r10, 0x7240        ; stack_ptr
STORE r10, r13          ; stack = empty

LDI r10, 0x7244        ; player_x
STORE r10, r13

LDI r10, 0x7245        ; player_y
STORE r10, r13

LDI r10, 0x7246        ; frame_count
STORE r10, r13

; Mark start cell as visited
LDI r13, 0x100
MOV r12, r20
STORE r12, r13          ; grid[0] = visited

; ===== MAIN LOOP =====
main_loop:
  FILL r18              ; clear screen

  CALL draw_maze

  LDI r10, 0x7243
  LOAD r10, r10          ; state

  LDI r11, 0
  CMP r10, r11
  JZ r0, do_generate    ; state == 0 -> generating

  LDI r11, 1
  CMP r10, r11
  JZ r0, start_playing  ; state == 1 -> just finished

  ; state == 2 -> playing
  CALL handle_input
  CALL draw_player
  CALL draw_goal
  JMP do_frame

start_playing:
  LDI r10, 0x7243
  LDI r13, 2
  STORE r10, r13        ; state = 2
  JMP do_frame

do_generate:
  ; Do multiple steps per frame for speed
  LDI r10, 4
gen_steps:
  CALL gen_step
  SUB r10, r7
  JNZ r10, gen_steps

  CALL draw_gen_head
  JMP do_frame

do_frame:
  LDI r10, 0x7246
  LOAD r11, r10
  ADD r11, r7
  STORE r10, r11

  FRAME
  JMP main_loop

; ===== GENERATION STEP =====
; One step of randomized DFS maze generation
gen_step:
  PUSH r31

  ; Load current position
  LDI r10, 0x7241
  LOAD r1, r10           ; r1 = gen_x
  LDI r10, 0x7242
  LOAD r2, r10           ; r2 = gen_y

  ; Check 4 neighbors for unvisited cells
  ; r3 = neighbor count (0..4)
  LDI r3, 0

  ; North (y-1): valid if y > 0 and grid[x + (y-1)*16] bit 8 clear
  LDI r4, 0
  CMP r2, r4
  JZ r0, chk_south      ; y==0, skip north
  ; Check visited: index = (y-1)*16 + x
  PUSH r1
  PUSH r2
  SUB r2, r7            ; y-1
  CALL calc_index        ; r5 = index
  MOV r6, r20
  ADD r6, r5
  LOAD r6, r6
  LDI r4, 0x100
  AND r6, r4            ; r6 = visited bit
  POP r2
  POP r1
  CMP r6, r4
  JZ r0, has_north      ; not visited -> has unvisited neighbor
  JMP chk_south
has_north:
  ADD r3, r7

chk_south:
  ; South (y+1): valid if y < 15
  LDI r4, 15
  CMP r2, r4
  BGE r0, chk_east      ; y>=15, skip
  PUSH r1
  PUSH r2
  ADD r2, r7            ; y+1
  CALL calc_index
  MOV r6, r20
  ADD r6, r5
  LOAD r6, r6
  LDI r4, 0x100
  AND r6, r4
  POP r2
  POP r1
  CMP r6, r4
  JZ r0, has_south
  JMP chk_east
has_south:
  ADD r3, r7

chk_east:
  ; East (x+1): valid if x < 15
  LDI r4, 15
  CMP r1, r4
  BGE r0, chk_west
  PUSH r1
  PUSH r2
  ADD r1, r7            ; x+1
  CALL calc_index
  MOV r6, r20
  ADD r6, r5
  LOAD r6, r6
  LDI r4, 0x100
  AND r6, r4
  POP r2
  POP r1
  CMP r6, r4
  JZ r0, has_east
  JMP chk_west
has_east:
  ADD r3, r7

chk_west:
  ; West (x-1): valid if x > 0
  LDI r4, 0
  CMP r1, r4
  JZ r0, neighbors_checked
  PUSH r1
  PUSH r2
  SUB r1, r7            ; x-1
  CALL calc_index
  MOV r6, r20
  ADD r6, r5
  LOAD r6, r6
  LDI r4, 0x100
  AND r6, r4
  POP r2
  POP r1
  CMP r6, r4
  JZ r0, has_west
  JMP neighbors_checked
has_west:
  ADD r3, r7

neighbors_checked:
  CMP r3, r7
  JZ r0, do_backtrack  ; no unvisited neighbors -> backtrack

  ; Pick random direction and try it
  RAND r4               ; random u32

  ; Try up to 4 times to find a valid unvisited neighbor
  LDI r12, 0            ; attempt counter
pick_dir:
  CMP r12, r7
  LDI r13, 4
  CMP r12, r13
  BGE r0, do_backtrack  ; tried 4 times, should not happen

  ; Direction from 2 bits of random
  MOV r5, r4
  AND r5, r7            ; dir = random & 1
  SHR r4, r7            ; shift random right

  ; Try to move in direction r5
  ; 0 = north, 1 = south
  ; If fails, try next 2 bits: 0=east, 1=west
  CMP r5, r7
  JZ r0, try_north_mv
  JMP try_south_mv

try_north_mv:
  ; North: y > 0 and (x, y-1) not visited
  LDI r6, 0
  CMP r2, r6
  JZ r0, pick_fail
  PUSH r1
  PUSH r2
  SUB r2, r7
  CALL calc_index
  MOV r6, r20
  ADD r6, r5
  LOAD r6, r6
  LDI r4, 0x100
  AND r6, r4
  POP r2
  POP r1
  CMP r6, r4
  JNZ r6, pick_fail     ; visited
  ; Remove wall and move
  ; Clear bit 0 (south wall) of cell (x, y-1)
  PUSH r1
  PUSH r2
  SUB r2, r7
  CALL calc_index
  MOV r6, r20
  ADD r6, r5
  LOAD r6, r6
  LDI r4, 0xFFFFFFFE
  AND r6, r4
  MOV r4, r20
  ADD r4, r5
  STORE r4, r6
  POP r2
  POP r1
  ; Move to (x, y-1)
  SUB r2, r7
  JMP gen_move_done

try_south_mv:
  LDI r6, 15
  CMP r2, r6
  BGE r0, pick_fail
  PUSH r1
  PUSH r2
  ADD r2, r7
  CALL calc_index
  MOV r6, r20
  ADD r6, r5
  LOAD r6, r6
  LDI r4, 0x100
  AND r6, r4
  POP r2
  POP r1
  CMP r6, r4
  JNZ r6, pick_fail
  ; Clear bit 0 (south wall) of current cell (x, y)
  CALL calc_index_cur   ; r5 = index of (r1, r2)
  MOV r6, r20
  ADD r6, r5
  LOAD r6, r6
  LDI r4, 0xFFFFFFFE
  AND r6, r4
  MOV r4, r20
  ADD r4, r5
  STORE r4, r6
  ADD r2, r7
  JMP gen_move_done

pick_fail:
  ADD r12, r7
  JMP pick_dir

gen_move_done:
  ; Push current (old) position onto stack before moving
  ; Actually we already moved r1/r2. Push old position.
  ; We need to push BEFORE moving. Let me restructure.
  ; The current position before move was (old_x, old_y).
  ; Since we modified r1/r2, we need to save them before.
  ; Actually: r1 and r2 were the OLD position. After the move above,
  ; r2 was modified. So the "current" is the new position.
  ; We want to push the OLD position. But we already modified r2.
  ; Let's just push the new current position (it's the one we moved to).
  ; For DFS, we push the current cell before exploring neighbors,
  ; and pop when backtracking. So push new position.
  JMP gen_push

do_backtrack:
  ; Pop from stack
  LDI r10, 0x7240
  LOAD r10, r10          ; stack_ptr
  LDI r4, 0
  CMP r10, r4
  JZ r0, gen_complete   ; stack empty -> maze done!

  SUB r10, r7            ; stack_ptr--
  LDI r11, 0x7240
  STORE r11, r10

  ; Pop x, y from stack[stack_ptr * 2] and stack[stack_ptr * 2 + 1]
  MOV r5, r10
  SHL r5, r7             ; r5 = stack_ptr * 2
  ; stack_x = stack_base + r5
  MOV r6, r21
  ADD r6, r5
  LOAD r1, r6            ; gen_x = stack[top].x
  ADD r6, r7
  LOAD r2, r6            ; gen_y = stack[top].y

  ; Store new current position
  LDI r10, 0x7241
  STORE r10, r1
  LDI r10, 0x7242
  STORE r10, r2

  JMP gen_step_done

gen_push:
  ; Push current position (r1, r2) onto stack
  LDI r10, 0x7240
  LOAD r10, r10          ; stack_ptr
  ; Check stack not full
  LDI r4, 32
  CMP r10, r4
  BGE r0, gen_step_done  ; stack full, skip push

  MOV r5, r10
  SHL r5, r7             ; r5 = stack_ptr * 2
  MOV r6, r21
  ADD r6, r5
  STORE r6, r1           ; stack[sp].x = gen_x
  ADD r6, r7
  STORE r6, r2           ; stack[sp].y = gen_y

  ADD r10, r7
  LDI r11, 0x7240
  STORE r11, r10         ; stack_ptr++

  ; Mark new cell as visited
  CALL calc_index_cur
  MOV r6, r20
  ADD r6, r5
  LOAD r6, r6
  LDI r4, 0x100
  OR r6, r4          ; set visited bit
  MOV r4, r20
  ADD r4, r5
  STORE r4, r6

  ; Store new current position
  LDI r10, 0x7241
  STORE r10, r1
  LDI r10, 0x7242
  STORE r10, r2

gen_step_done:
  POP r31
  RET

gen_complete:
  LDI r10, 0x7243
  LDI r13, 1
  STORE r10, r13        ; state = 1 (done generating)
  POP r31
  RET

; ===== DRAW MAZE =====
draw_maze:
  PUSH r31
  LDI r10, 0            ; y counter
  LDI r11, 16           ; limit

draw_y_loop:
  LDI r12, 0            ; x counter

draw_x_loop:
  ; Calculate screen position
  ; screen_x = 96 + x * 4
  MOV r13, r12
  SHL r13, r7           ; x * 2
  SHL r13, r7           ; x * 4
  LDI r4, 96
  ADD r13, r4           ; screen_x = 96 + x*4

  ; screen_y = 96 + y * 4
  MOV r1, r10
  SHL r1, r7
  SHL r1, r7
  ADD r1, r4            ; screen_y = 96 + y*4

  ; Get maze cell value
  CALL calc_index_xy    ; r5 = index
  MOV r2, r20
  ADD r2, r5
  LOAD r2, r2           ; r2 = cell value

  ; Draw 4x4 block for this cell
  LDI r4, 0x100
  AND r2, r4            ; check visited bit
  JZ r2, draw_wall_cell ; not visited -> wall color

  ; Visited cell: draw passage, then draw walls on edges
  ; First fill 4x4 with passage color
  CALL draw_4x4_passage

  ; Draw south wall if bit 0 set
  MOV r2, r20
  ADD r2, r5
  LOAD r2, r2
  LDI r4, 1
  AND r2, r4
  JZ r2, no_south_wall
  ; Draw south wall: line at bottom of cell (y+3)
  MOV r3, r1
  ADD r3, r7
  ADD r3, r7
  ADD r3, r7            ; sy = screen_y + 3
  CALL draw_hline_4
no_south_wall:

  ; Draw east wall if bit 1 set
  MOV r2, r20
  ADD r2, r5
  LOAD r2, r2
  LDI r4, 2
  AND r2, r4
  JZ r2, no_east_wall
  ; Draw east wall: line at right of cell (x+3)
  MOV r3, r13
  ADD r3, r7
  ADD r3, r7
  ADD r3, r7            ; sx = screen_x + 3
  CALL draw_vline_4
no_east_wall:

  JMP draw_next_cell

draw_wall_cell:
  ; Draw 4x4 wall block
  CALL draw_4x4_wall

draw_next_cell:
  ADD r12, r7
  LDI r4, 16
  CMP r12, r4
  BLT r0, draw_x_loop

  ADD r10, r7
  CMP r10, r11
  BLT r0, draw_y_loop

  ; Draw outer border
  LDI r13, 96
  LDI r1, 96
  LDI r4, 64
  CALL draw_border
  POP r31
  RET

; Draw 4x4 passage block at (r13=screen_x, r1=screen_y) with color r15
draw_4x4_passage:
  PUSH r31
  MOV r3, r1
  PSET r13, r3, r15
  ADD r3, r7
  PSET r13, r3, r15
  ADD r3, r7
  PSET r13, r3, r15
  ADD r3, r7
  PSET r13, r3, r15
  ADD r13, r7
  MOV r3, r1
  PSET r13, r3, r15
  ADD r3, r7
  PSET r13, r3, r15
  ADD r3, r7
  PSET r13, r3, r15
  ADD r3, r7
  PSET r13, r3, r15
  ADD r13, r7
  MOV r3, r1
  PSET r13, r3, r15
  ADD r3, r7
  PSET r13, r3, r15
  ADD r3, r7
  PSET r13, r3, r15
  ADD r3, r7
  PSET r13, r3, r15
  ADD r13, r7
  MOV r3, r1
  PSET r13, r3, r15
  ADD r3, r7
  PSET r13, r3, r15
  ADD r3, r7
  PSET r13, r3, r15
  ADD r3, r7
  PSET r13, r3, r15
  POP r31
  RET

; Draw 4x4 wall block at (r13=screen_x, r1=screen_y) with color r14
draw_4x4_wall:
  PUSH r31
  MOV r3, r1
  PSET r13, r3, r14
  ADD r3, r7
  PSET r13, r3, r14
  ADD r3, r7
  PSET r13, r3, r14
  ADD r3, r7
  PSET r13, r3, r14
  ADD r13, r7
  MOV r3, r1
  PSET r13, r3, r14
  ADD r3, r7
  PSET r13, r3, r14
  ADD r3, r7
  PSET r13, r3, r14
  ADD r3, r7
  PSET r13, r3, r14
  ADD r13, r7
  MOV r3, r1
  PSET r13, r3, r14
  ADD r3, r7
  PSET r13, r3, r14
  ADD r3, r7
  PSET r13, r3, r14
  ADD r3, r7
  PSET r13, r3, r14
  ADD r13, r7
  MOV r3, r1
  PSET r13, r3, r14
  ADD r3, r7
  PSET r13, r3, r14
  ADD r3, r7
  PSET r13, r3, r14
  ADD r3, r7
  PSET r13, r3, r14
  POP r31
  RET

; Draw horizontal line of 4 pixels at (r13=x, r3=y) with color r14
draw_hline_4:
  PSET r13, r3, r14
  ADD r13, r7
  PSET r13, r3, r14
  ADD r13, r7
  PSET r13, r3, r14
  ADD r13, r7
  PSET r13, r3, r14
  RET

; Draw vertical line of 4 pixels at (r3=x, r1=y) with color r14
draw_vline_4:
  PSET r3, r1, r14
  ADD r1, r7
  PSET r3, r1, r14
  ADD r1, r7
  PSET r3, r1, r14
  ADD r1, r7
  PSET r3, r1, r14
  RET

; Draw border around maze area
; r13 = x_start, r1 = y_start, r4 = size
draw_border:
  PUSH r31
  ; Top edge
  MOV r5, r13
  MOV r6, r1
border_top:
  PSET r5, r6, r14
  ADD r5, r7
  SUB r4, r7
  JNZ r4, border_top

  ; Bottom edge
  LDI r4, 64
  ADD r1, r7
  ADD r1, r7
  ADD r1, r7            ; y + 3
  MOV r5, r13
border_bot:
  PSET r5, r1, r14
  ADD r5, r7
  SUB r4, r7
  JNZ r4, border_bot

  ; Left edge
  LDI r4, 64
  MOV r5, r13
  MOV r6, r1
  LDI r8, 96            ; reset y
  MOV r6, r8
border_left:
  PSET r5, r6, r14
  ADD r6, r7
  SUB r4, r7
  JNZ r4, border_left

  ; Right edge
  LDI r4, 64
  ADD r13, r7
  ADD r13, r7
  ADD r13, r7            ; x + 3
  MOV r6, r8            ; y = 96
border_right:
  PSET r13, r6, r14
  ADD r6, r7
  SUB r4, r7
  JNZ r4, border_right

  POP r31
  RET

; ===== DRAW GENERATION HEAD =====
draw_gen_head:
  PUSH r31
  LDI r10, 0x7243
  LOAD r10, r10
  LDI r4, 1
  CMP r10, r4
  BGE r0, gen_head_done  ; not generating

  LDI r10, 0x7241
  LOAD r10, r10          ; gen_x
  LDI r11, 0x7242
  LOAD r11, r11          ; gen_y

  ; screen_x = 96 + gen_x * 4
  MOV r13, r10
  SHL r13, r7
  SHL r13, r7
  LDI r4, 96
  ADD r13, r4

  ; screen_y = 96 + gen_y * 4
  MOV r1, r11
  SHL r1, r7
  SHL r1, r7
  ADD r1, r4

  ; Draw 2x2 yellow block at center of cell
  ADD r13, r7
  ADD r1, r7
  PSET r13, r1, r17
  ADD r13, r7
  PSET r13, r1, r17
  ADD r1, r7
  PSET r13, r1, r17
  SUB r13, r7
  PSET r13, r1, r17

gen_head_done:
  POP r31
  RET

; ===== HANDLE INPUT (playing mode) =====
handle_input:
  PUSH r31
  LDI r10, 0xFFB
  LOAD r10, r10          ; key bitmask

  LDI r4, 0
  CMP r10, r4
  JZ r0, input_done     ; no key pressed

  ; Load player position
  LDI r10, 0x7244
  LOAD r1, r10           ; player_x
  LDI r10, 0x7245
  LOAD r2, r10           ; player_y

  ; Bit 0 = up
  LDI r10, 0xFFB
  LOAD r10, r10
  LDI r4, 1
  AND r10, r4
  JZ r10, chk_down
  ; Try move up (north): check south wall of cell above
  LDI r4, 0
  CMP r2, r4
  JZ r0, chk_down       ; y==0, can't move up
  ; Check: cell (x, y-1) bit 0 (south wall)
  PUSH r1
  PUSH r2
  SUB r2, r7
  CALL calc_index        ; r5 = index of (x, y-1)
  MOV r6, r20
  ADD r6, r5
  LOAD r6, r6
  LDI r4, 1
  AND r6, r4            ; south wall bit
  POP r2
  POP r1
  CMP r6, r4
  JNZ r6, chk_down      ; wall present, can't move
  SUB r2, r7            ; move up

chk_down:
  LDI r10, 0xFFB
  LOAD r10, r10
  LDI r4, 2
  AND r10, r4
  JZ r10, chk_left
  LDI r4, 15
  CMP r2, r4
  BGE r0, chk_left
  ; Check: cell (x, y) bit 0 (south wall)
  PUSH r1
  PUSH r2
  CALL calc_index_cur
  MOV r6, r20
  ADD r6, r5
  LOAD r6, r6
  LDI r4, 1
  AND r6, r4
  POP r2
  POP r1
  CMP r6, r4
  JNZ r6, chk_left
  ADD r2, r7

chk_left:
  LDI r10, 0xFFB
  LOAD r10, r10
  LDI r4, 4
  AND r10, r4
  JZ r10, chk_right
  LDI r4, 0
  CMP r1, r4
  JZ r0, chk_right
  ; Check: cell (x-1, y) bit 1 (east wall)
  PUSH r1
  PUSH r2
  SUB r1, r7
  CALL calc_index
  MOV r6, r20
  ADD r6, r5
  LOAD r6, r6
  LDI r4, 2
  AND r6, r4
  POP r2
  POP r1
  CMP r6, r4
  JNZ r6, chk_right
  SUB r1, r7

chk_right:
  LDI r10, 0xFFB
  LOAD r10, r10
  LDI r4, 8
  AND r10, r4
  JZ r10, input_done
  LDI r4, 15
  CMP r1, r4
  BGE r0, input_done
  ; Check: cell (x, y) bit 1 (east wall)
  PUSH r1
  PUSH r2
  CALL calc_index_cur
  MOV r6, r20
  ADD r6, r5
  LOAD r6, r6
  LDI r4, 2
  AND r6, r4
  POP r2
  POP r1
  CMP r6, r4
  JNZ r6, input_done
  ADD r1, r7

input_done:
  ; Store player position
  LDI r10, 0x7244
  STORE r10, r1
  LDI r10, 0x7245
  STORE r10, r2
  POP r31
  RET

; ===== DRAW PLAYER =====
draw_player:
  PUSH r31
  LDI r10, 0x7244
  LOAD r10, r10          ; player_x
  LDI r11, 0x7245
  LOAD r11, r11          ; player_y

  MOV r13, r10
  SHL r13, r7
  SHL r13, r7
  LDI r4, 96
  ADD r13, r4           ; screen_x
  ADD r13, r7           ; +1 for center

  MOV r1, r11
  SHL r1, r7
  SHL r1, r7
  ADD r1, r4            ; screen_y
  ADD r1, r7            ; +1

  PSET r13, r1, r16
  ADD r13, r7
  PSET r13, r1, r16
  ADD r1, r7
  PSET r13, r1, r16
  SUB r13, r7
  PSET r13, r1, r16

  POP r31
  RET

; ===== DRAW GOAL =====
draw_goal:
  PUSH r31
  ; Goal at (15, 15)
  LDI r13, 15
  SHL r13, r7
  SHL r13, r7
  LDI r4, 96
  ADD r13, r4           ; screen_x
  ADD r13, r7

  LDI r1, 15
  SHL r1, r7
  SHL r1, r7
  ADD r1, r4            ; screen_y
  ADD r1, r7

  PSET r13, r1, r19
  ADD r13, r7
  PSET r13, r1, r19
  ADD r1, r7
  PSET r13, r1, r19
  SUB r13, r7
  PSET r13, r1, r19

  POP r31
  RET

; ===== HELPERS =====

; calc_index: compute grid index from r1=x, r11=y
; Output: r5 = y * 16 + x
calc_index:
  MOV r5, r11
  LDI r6, 16
  MUL r5, r6
  ADD r5, r1
  RET

; calc_index_cur: compute grid index from current gen position (r1, r2)
; Output: r5 = r2 * 16 + r1
calc_index_cur:
  MOV r5, r2
  LDI r6, 16
  MUL r5, r6
  ADD r5, r1
  RET

; calc_index_xy: compute grid index from draw position (r12=x, r10=y)
; Output: r5 = r10 * 16 + r12
calc_index_xy:
  MOV r5, r10
  LDI r6, 16
  MUL r5, r6
  ADD r5, r12
  RET
