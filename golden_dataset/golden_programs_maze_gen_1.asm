; DESCRIPTION: The GeOS assembly code implements a procedural maze generator using depth-first search with backtracking. It generates a solvable maze on a 256x256 screen grid of 16x16 cells, where each cell is 16 pixels by 16 pixels. The algorithm starts at the top-left corner (0,0), marks visited cells, and removes walls to create passages, backtracking when no unvisited neighbors are available until all cells are visited. The maze is then drawn with white walls and black passages, while green markers indicate the entrance and exit.

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
;   r6  = 1
;   r14  = 16 (grid size)
;   r15  = 16 (cell size in pixels)
;   r13 = current cell index
;   r3 = current cx
;   r9 = current cy
;   r8 = visited count
;   r12 = 256 (total cells)
;   r20 = stack pointer

; === Constants ===
LDI r6, 1
LDI r14, 16
LDI r15, 16
LDI r12, 256
LDI r20, 0             ; stack top (empty)

; === Initialize all walls (set all to 1 = wall exists) ===
; Horizontal walls: 17 rows * 16 cols = 272 entries at 0x4100
LDI r13, 0
LDI r5, 0x4100
LDI r16, 272
init_hwalls:
  LDI r17, 1
  STORE r5, r17
  ADD r5, r6
  ADD r13, r6
  CMP r13, r16
  BLT r7, init_hwalls

; Vertical walls: 16 rows * 17 cols = 272 entries at 0x4300
LDI r13, 0
LDI r5, 0x4300
init_vwalls:
  LDI r17, 1
  STORE r5, r17
  ADD r5, r6
  ADD r13, r6
  CMP r13, r16
  BLT r7, init_vwalls

; === Clear visited flags ===
LDI r13, 0
LDI r5, 0x4000
init_visited:
  LDI r17, 0
  STORE r5, r17
  ADD r5, r6
  ADD r13, r6
  CMP r13, r12
  BLT r7, init_visited

; === Start maze generation ===
LDI r13, 0             ; current cell = 0
LDI r3, 0             ; cx = 0
LDI r9, 0             ; cy = 0
LDI r8, 1             ; visited_count = 1

; Mark (0,0) visited
LDI r5, 0x4000
STORE r5, r6          ; visited[0] = 1

; === Main generation loop ===
gen_loop:
  ; Check if all cells visited
  CMP r8, r12
  BGE r7, gen_done

  ; --- Try UP: cy > 0 and visited[cx + (cy-1)*16] == 0 ---
  LDI r5, 0
  CMP r9, r5
  JZ r7, try_down

  MOV r5, r9
  SUB r5, r6
  MUL r5, r14
  ADD r5, r3
  LDI r16, 0x4000
  ADD r16, r5
  LOAD r16, r16
  JNZ r16, try_down

  ; Remove h_wall[cy][cx]
  MOV r5, r9
  MUL r5, r14
  ADD r5, r3
  LDI r16, 0x4100
  ADD r16, r5
  LDI r17, 0
  STORE r16, r17

  ; Push current
  LDI r16, 0x5000
  ADD r16, r20
  STORE r16, r13
  ADD r20, r6

  ; Move UP: cy--
  SUB r9, r6
  MOV r13, r9
  MUL r13, r14
  ADD r13, r3
  LDI r16, 0x4000
  ADD r16, r13
  STORE r16, r6
  ADD r8, r6
  JMP gen_loop

try_down:
  ; --- Try DOWN: cy < 15 and visited[cx + (cy+1)*16] == 0 ---
  LDI r5, 15
  CMP r9, r5
  BGE r7, try_left

  MOV r5, r9
  ADD r5, r6
  MUL r5, r14
  ADD r5, r3
  LDI r16, 0x4000
  ADD r16, r5
  LOAD r16, r16
  JNZ r16, try_left

  ; Remove h_wall[cy+1][cx]
  MOV r5, r9
  ADD r5, r6
  MUL r5, r14
  ADD r5, r3
  LDI r16, 0x4100
  ADD r16, r5
  LDI r17, 0
  STORE r16, r17

  ; Push current
  LDI r16, 0x5000
  ADD r16, r20
  STORE r16, r13
  ADD r20, r6

  ; Move DOWN: cy++
  ADD r9, r6
  MOV r13, r9
  MUL r13, r14
  ADD r13, r3
  LDI r16, 0x4000
  ADD r16, r13
  STORE r16, r6
  ADD r8, r6
  JMP gen_loop

try_left:
  ; --- Try LEFT: cx > 0 and visited[(cx-1) + cy*16] == 0 ---
  LDI r5, 0
  CMP r3, r5
  JZ r7, try_right

  MOV r5, r3
  SUB r5, r6
  MOV r16, r9
  MUL r16, r14
  ADD r16, r5
  LDI r17, 0x4000
  ADD r17, r16
  LOAD r17, r17
  JNZ r17, try_right

  ; Remove v_wall[cy][cx]
  MOV r5, r9
  LDI r16, 17
  MUL r5, r16
  ADD r5, r3
  LDI r16, 0x4300
  ADD r16, r5
  LDI r17, 0
  STORE r16, r17

  ; Push current
  LDI r16, 0x5000
  ADD r16, r20
  STORE r16, r13
  ADD r20, r6

  ; Move LEFT: cx--
  SUB r3, r6
  MOV r13, r9
  MUL r13, r14
  ADD r13, r3
  LDI r16, 0x4000
  ADD r16, r13
  STORE r16, r6
  ADD r8, r6
  JMP gen_loop

try_right:
  ; --- Try RIGHT: cx < 15 and visited[(cx+1) + cy*16] == 0 ---
  LDI r5, 15
  CMP r3, r5
  BGE r7, backtrack

  MOV r5, r3
  ADD r5, r6
  MOV r16, r9
  MUL r16, r14
  ADD r16, r5
  LDI r17, 0x4000
  ADD r17, r16
  LOAD r17, r17
  JNZ r17, backtrack

  ; Remove v_wall[cy][cx+1]
  MOV r5, r9
  LDI r16, 17
  MUL r5, r16
  MOV r16, r3
  ADD r16, r6
  ADD r5, r16
  LDI r16, 0x4300
  ADD r16, r5
  LDI r17, 0
  STORE r16, r17

  ; Push current
  LDI r16, 0x5000
  ADD r16, r20
  STORE r16, r13
  ADD r20, r6

  ; Move RIGHT: cx++
  ADD r3, r6
  MOV r13, r9
  MUL r13, r14
  ADD r13, r3
  LDI r16, 0x4000
  ADD r16, r13
  STORE r16, r6
  ADD r8, r6
  JMP gen_loop

backtrack:
  ; Pop from stack
  LDI r5, 0
  CMP r20, r5
  JZ r7, gen_done       ; stack empty, maze complete

  SUB r20, r6
  LDI r16, 0x5000
  ADD r16, r20
  LOAD r13, r16

  ; Recover cx, cy from index
  MOV r5, r13
  LDI r16, 16
  MOD r5, r16
  MOV r3, r5          ; cx = index % 16
  MOV r5, r13
  LDI r16, 16
  DIV r5, r16
  MOV r9, r5          ; cy = index / 16
  JMP gen_loop

gen_done:
  ; === Draw the maze ===
  LDI r2, 0xFFFFFF      ; white for walls

  ; Draw horizontal walls: 17 rows of 16
  LDI r13, 0            ; ry

draw_hwalls:
  LDI r3, 0            ; cx

draw_hw_col:
  MOV r5, r13
  MUL r5, r14
  ADD r5, r3
  LDI r16, 0x4100
  ADD r16, r5
  LOAD r16, r16
  JZ r16, draw_hw_next

  MOV r16, r3
  MUL r16, r15           ; x = cx*16
  MOV r17, r13
  MUL r17, r15           ; y = ry*16
  LDI r18, 16
  LDI r19, 1
  RECTF r16, r17, r18, r19, r2

draw_hw_next:
  ADD r3, r6
  CMP r3, r14
  BLT r7, draw_hw_col

  ADD r13, r6
  LDI r5, 17
  CMP r13, r5
  BLT r7, draw_hwalls

  ; Draw vertical walls: 16 rows of 17
  LDI r13, 0            ; cy

draw_vwalls:
  LDI r3, 0            ; cx

draw_vw_col:
  MOV r5, r13
  LDI r16, 17
  MUL r5, r16
  ADD r5, r3
  LDI r16, 0x4300
  ADD r16, r5
  LOAD r16, r16
  JZ r16, draw_vw_next

  MOV r16, r3
  MUL r16, r15           ; x = cx*16
  MOV r17, r13
  MUL r17, r15           ; y = cy*16
  LDI r18, 1
  LDI r19, 16
  RECTF r16, r17, r18, r19, r2

draw_vw_next:
  ADD r3, r6
  LDI r5, 17
  CMP r3, r5
  BLT r7, draw_vw_col

  ADD r13, r6
  CMP r13, r14
  BLT r7, draw_vwalls

  ; Entrance marker (green rect in cell 0,0)
  LDI r2, 0x00FF00
  LDI r16, 1
  LDI r17, 1
  LDI r18, 14
  LDI r19, 14
  RECTF r16, r17, r18, r19, r2

  ; Exit marker (green rect in cell 15,15)
  LDI r16, 241
  LDI r17, 241
  RECTF r16, r17, r18, r19, r2

  HALT
