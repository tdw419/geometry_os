; DESCRIPTION: Geometry OS program to draw a green object.

; maze_gen.asm -- procedural maze generator (static, non-interactive)
;
; Generates a solvable maze on the 256x256 screen using depth-first
; search with backtracking. Cell size = 16px, grid = 16x16 cells.
; Draws white walls, black passages, green entrance/exit markers.
;
; Algorithm (iterative with explicit stack):
;   1. Start at cell (0,0), mark visited
;   2. Try unvisited neighbor (up/down/left/right, first available)
;   3. Remove wall between current and neighbor, move to neighbor
;   4. If no unvisited neighbors, backtrack to previous cell
;   5. Repeat until all 256 cells visited
;
; Memory layout:
;   0x4000-0x40FF: visited flags (256 entries, 1 per cell, row-major)
;   0x4100-0x420F: horizontal walls (17 rows of 16 = 272 entries)
;   0x4300-0x440F: vertical walls (16 rows of 17 = 272 entries)
;   0x5000-0x51FF: backtrack stack (up to 256 entries)
;
; Register convention:
;   r3  = 1
;   r6  = 16 (grid size)
;   r10  = 16 (cell size in pixels)
;   r7 = current cell index
;   r12 = current cx
;   r14 = current cy
;   r9 = visited count
;   r8 = 256 (total cells)
;   r20 = stack pointer

; === Constants ===
LDI r3, 1
LDI r6, 16
LDI r10, 16
LDI r8, 256
LDI r20, 0             ; stack top (empty)

; === Initialize all walls (set all to 1 = wall exists) ===
; Horizontal walls: 17 rows * 16 cols = 272 entries at 0x4100
LDI r7, 0
LDI r15, 0x4100
LDI r16, 272
init_hwalls:
  LDI r17, 1
  STORE r15, r17
  ADD r15, r3
  ADD r7, r3
  CMP r7, r16
  BLT r11, init_hwalls

; Vertical walls: 16 rows * 17 cols = 272 entries at 0x4300
LDI r7, 0
LDI r15, 0x4300
init_vwalls:
  LDI r17, 1
  STORE r15, r17
  ADD r15, r3
  ADD r7, r3
  CMP r7, r16
  BLT r11, init_vwalls

; === Clear visited flags ===
LDI r7, 0
LDI r15, 0x4000
init_visited:
  LDI r17, 0
  STORE r15, r17
  ADD r15, r3
  ADD r7, r3
  CMP r7, r8
  BLT r11, init_visited

; === Start maze generation ===
LDI r7, 0             ; current cell = 0
LDI r12, 0             ; cx = 0
LDI r14, 0             ; cy = 0
LDI r9, 1             ; visited_count = 1

; Mark (0,0) visited
LDI r15, 0x4000
STORE r15, r3          ; visited[0] = 1

; === Main generation loop ===
gen_loop:
  ; Check if all cells visited
  CMP r9, r8
  BGE r11, gen_done

  ; --- Try UP: cy > 0 and visited[cx + (cy-1)*16] == 0 ---
  LDI r15, 0
  CMP r14, r15
  JZ r11, try_down

  MOV r15, r14
  SUB r15, r3
  MUL r15, r6
  ADD r15, r12
  LDI r16, 0x4000
  ADD r16, r15
  LOAD r16, r16
  JNZ r16, try_down

  ; Remove h_wall[cy][cx]
  MOV r15, r14
  MUL r15, r6
  ADD r15, r12
  LDI r16, 0x4100
  ADD r16, r15
  LDI r17, 0
  STORE r16, r17

  ; Push current
  LDI r16, 0x5000
  ADD r16, r20
  STORE r16, r7
  ADD r20, r3

  ; Move UP: cy--
  SUB r14, r3
  MOV r7, r14
  MUL r7, r6
  ADD r7, r12
  LDI r16, 0x4000
  ADD r16, r7
  STORE r16, r3
  ADD r9, r3
  JMP gen_loop

try_down:
  ; --- Try DOWN: cy < 15 and visited[cx + (cy+1)*16] == 0 ---
  LDI r15, 15
  CMP r14, r15
  BGE r11, try_left

  MOV r15, r14
  ADD r15, r3
  MUL r15, r6
  ADD r15, r12
  LDI r16, 0x4000
  ADD r16, r15
  LOAD r16, r16
  JNZ r16, try_left

  ; Remove h_wall[cy+1][cx]
  MOV r15, r14
  ADD r15, r3
  MUL r15, r6
  ADD r15, r12
  LDI r16, 0x4100
  ADD r16, r15
  LDI r17, 0
  STORE r16, r17

  ; Push current
  LDI r16, 0x5000
  ADD r16, r20
  STORE r16, r7
  ADD r20, r3

  ; Move DOWN: cy++
  ADD r14, r3
  MOV r7, r14
  MUL r7, r6
  ADD r7, r12
  LDI r16, 0x4000
  ADD r16, r7
  STORE r16, r3
  ADD r9, r3
  JMP gen_loop

try_left:
  ; --- Try LEFT: cx > 0 and visited[(cx-1) + cy*16] == 0 ---
  LDI r15, 0
  CMP r12, r15
  JZ r11, try_right

  MOV r15, r12
  SUB r15, r3
  MOV r16, r14
  MUL r16, r6
  ADD r16, r15
  LDI r17, 0x4000
  ADD r17, r16
  LOAD r17, r17
  JNZ r17, try_right

  ; Remove v_wall[cy][cx]
  MOV r15, r14
  LDI r16, 17
  MUL r15, r16
  ADD r15, r12
  LDI r16, 0x4300
  ADD r16, r15
  LDI r17, 0
  STORE r16, r17

  ; Push current
  LDI r16, 0x5000
  ADD r16, r20
  STORE r16, r7
  ADD r20, r3

  ; Move LEFT: cx--
  SUB r12, r3
  MOV r7, r14
  MUL r7, r6
  ADD r7, r12
  LDI r16, 0x4000
  ADD r16, r7
  STORE r16, r3
  ADD r9, r3
  JMP gen_loop

try_right:
  ; --- Try RIGHT: cx < 15 and visited[(cx+1) + cy*16] == 0 ---
  LDI r15, 15
  CMP r12, r15
  BGE r11, backtrack

  MOV r15, r12
  ADD r15, r3
  MOV r16, r14
  MUL r16, r6
  ADD r16, r15
  LDI r17, 0x4000
  ADD r17, r16
  LOAD r17, r17
  JNZ r17, backtrack

  ; Remove v_wall[cy][cx+1]
  MOV r15, r14
  LDI r16, 17
  MUL r15, r16
  MOV r16, r12
  ADD r16, r3
  ADD r15, r16
  LDI r16, 0x4300
  ADD r16, r15
  LDI r17, 0
  STORE r16, r17

  ; Push current
  LDI r16, 0x5000
  ADD r16, r20
  STORE r16, r7
  ADD r20, r3

  ; Move RIGHT: cx++
  ADD r12, r3
  MOV r7, r14
  MUL r7, r6
  ADD r7, r12
  LDI r16, 0x4000
  ADD r16, r7
  STORE r16, r3
  ADD r9, r3
  JMP gen_loop

backtrack:
  ; Pop from stack
  LDI r15, 0
  CMP r20, r15
  JZ r11, gen_done       ; stack empty, maze complete

  SUB r20, r3
  LDI r16, 0x5000
  ADD r16, r20
  LOAD r7, r16

  ; Recover cx, cy from index
  MOV r15, r7
  LDI r16, 16
  MOD r15, r16
  MOV r12, r15          ; cx = index % 16
  MOV r15, r7
  LDI r16, 16
  DIV r15, r16
  MOV r14, r15          ; cy = index / 16
  JMP gen_loop

gen_done:
  ; === Draw the maze ===
  LDI r13, 0xFFFFFF      ; white for walls

  ; Draw horizontal walls: 17 rows of 16
  LDI r7, 0            ; ry

draw_hwalls:
  LDI r12, 0            ; cx

draw_hw_col:
  MOV r15, r7
  MUL r15, r6
  ADD r15, r12
  LDI r16, 0x4100
  ADD r16, r15
  LOAD r16, r16
  JZ r16, draw_hw_next

  MOV r16, r12
  MUL r16, r10           ; x = cx*16
  MOV r17, r7
  MUL r17, r10           ; y = ry*16
  LDI r18, 16
  LDI r19, 1
  RECTF r16, r17, r18, r19, r13

draw_hw_next:
  ADD r12, r3
  CMP r12, r6
  BLT r11, draw_hw_col

  ADD r7, r3
  LDI r15, 17
  CMP r7, r15
  BLT r11, draw_hwalls

  ; Draw vertical walls: 16 rows of 17
  LDI r7, 0            ; cy

draw_vwalls:
  LDI r12, 0            ; cx

draw_vw_col:
  MOV r15, r7
  LDI r16, 17
  MUL r15, r16
  ADD r15, r12
  LDI r16, 0x4300
  ADD r16, r15
  LOAD r16, r16
  JZ r16, draw_vw_next

  MOV r16, r12
  MUL r16, r10           ; x = cx*16
  MOV r17, r7
  MUL r17, r10           ; y = cy*16
  LDI r18, 1
  LDI r19, 16
  RECTF r16, r17, r18, r19, r13

draw_vw_next:
  ADD r12, r3
  LDI r15, 17
  CMP r12, r15
  BLT r11, draw_vw_col

  ADD r7, r3
  CMP r7, r6
  BLT r11, draw_vwalls

  ; Entrance marker (green rect in cell 0,0)
  LDI r13, 0x00FF00
  LDI r16, 1
  LDI r17, 1
  LDI r18, 14
  LDI r19, 14
  RECTF r16, r17, r18, r19, r13

  ; Exit marker (green rect in cell 15,15)
  LDI r16, 241
  LDI r17, 241
  RECTF r16, r17, r18, r19, r13

  HALT
