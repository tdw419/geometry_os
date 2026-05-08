; DESCRIPTION: This GeOS assembly code implements a randomized maze generation and player navigation system. The game features a 31x31 grid-based maze rendered on a 256x256 screen, where the player navigates using WASD keys to move and R to restart with a new maze. Collision detection is based on reading pixel colors at wall centers. The maze generation uses a depth-first search (DFS) algorithm stored in a stack, and the game loop handles user input and updates the display accordingly.

; maze.asm -- Randomly generated maze with player navigation
;
; Controls: WASD to move, R to restart with new maze
; Goal: navigate from top-left to bottom-right (green square)
;
; Screen: 256x256, maze grid 31x31 at 8px each = 248x248, 4px margin
;
; Collision detection: PEEK-based -- reads screen pixel at wall center
;   Wall color 0x4466AA. Wall block centers computed as:
;     up:    (px*16+15, py*16+7)
;     down:  (px*16+15, py*16+23)
;     left:  (px*16+7,  py*16+15)
;     right: (px*16+23, py*16+15)
;
; Memory layout:
;   0x5000..0x507B  grid[31 rows] u32 bitmasks (1=wall, 0=passage)
;   0x5100..0x51E0  visited[225] 1 byte per maze cell (0-14 coords)
;   0x5200..0x52FF  dfs_stack[256] u32 entries (gx<<8)|gy
;   0x5300          dfs_sp
;   0x5310          player_x  (0-14)
;   0x5311          player_y  (0-14)
;   0x5312          won       (0=play, 1=won)
;   0x5313          old_px
;   0x5314          old_py
;   0x5320..0x5328  "YOU WIN!" null-terminated
;   0x5330..0x5337  "PRESS R" null-terminated
;
; Grid convention:
;   31x31 grid where odd coords are maze cells, even coords are walls
;   Cell (cx,cy) maps to grid (cx*2+1, cy*2+1)
;   Wall between cell (cx,cy) and (cx+1,cy) at grid (cx*2+2, cy*2+1)

; ── Restart / Init ──────────────────────────────────────────────

restart:
  LDI r30, 0x8000       ; stack pointer

  CALL init_grid         ; set all 31 rows to 0xFFFFFFFF
  CALL clear_visited     ; zero 225 bytes at 0x5100
  CALL init_sp           ; dfs_sp = 0
  CALL init_text         ; store win/restart text strings
  CALL generate_maze     ; randomized DFS backtracker

  ; Set player at (0,0)
  LDI r15, 0
  LDI r6, 0x5310
  STORE r6, r15
  LDI r6, 0x5311
  STORE r6, r15
  LDI r6, 0x5313
  STORE r6, r15           ; old_px = 0
  LDI r6, 0x5314
  STORE r6, r15           ; old_py = 0

  ; won = 0
  LDI r15, 0
  LDI r6, 0x5312
  STORE r6, r15

  ; Render maze, goal, player
  CALL render_maze
  CALL draw_goal
  CALL draw_player

; ── Main Game Loop ───────────────────────────────────────────────

game_loop:
  ; Check win
  LDI r6, 0x5312
  LOAD r15, r6
  JNZ r15, win_screen

  ; Read keyboard
  IKEY r3
  JZ r3, idle           ; no key, just frame

  ; W = up
  LDI r7, 87
  CMP r3, r7
  JZ r5, try_up
  LDI r7, 119
  CMP r3, r7
  JZ r5, try_up

  ; S = down
  LDI r7, 83
  CMP r3, r7
  JZ r5, try_down
  LDI r7, 115
  CMP r3, r7
  JZ r5, try_down

  ; A = left
  LDI r7, 65
  CMP r3, r7
  JZ r5, try_left
  LDI r7, 97
  CMP r3, r7
  JZ r5, try_left

  ; D = right
  LDI r7, 68
  CMP r3, r7
  JZ r5, try_right
  LDI r7, 100
  CMP r3, r7
  JZ r5, try_right

  ; R = restart
  LDI r7, 82
  CMP r3, r7
  JZ r5, restart
  LDI r7, 114
  CMP r3, r7
  JZ r5, restart

  JMP idle

; ── Movement Handlers ────────────────────────────────────────────
; PEEK-based collision detection -- reads screen pixel at wall center
; Wall color 0x4466AA, background 0x001020
; Wall block centers: up(16*px+15, 16*py+7) down(16*px+15, 16*py+23)
;                      left(16*px+7, 16*py+15) right(16*px+23, 16*py+15)

try_up:
  LDI r6, 0x5310
  LOAD r8, r6           ; r8 = px
  LDI r6, 0x5311
  LOAD r2, r6           ; r2 = py
  LDI r4, 4
  SHL r8, r4            ; r8 = px*16
  LDI r4, 15
  ADD r8, r4            ; r8 = px*16+15
  LDI r4, 4
  SHL r2, r4            ; r2 = py*16
  LDI r4, 7
  ADD r2, r4            ; r2 = py*16+7
  PEEK r8, r2, r15       ; r15 = pixel at wall center
  LDI r4, 0x4466AA
  CMP r15, r4
  JZ r5, idle           ; wall found, block
  CALL save_old_pos
  LDI r6, 0x5311
  LOAD r15, r6
  LDI r4, 1
  SUB r15, r4
  STORE r6, r15
  JMP after_move

try_down:
  LDI r6, 0x5310
  LOAD r8, r6           ; r8 = px
  LDI r6, 0x5311
  LOAD r2, r6           ; r2 = py
  LDI r4, 4
  SHL r8, r4            ; r8 = px*16
  LDI r4, 15
  ADD r8, r4            ; r8 = px*16+15
  LDI r4, 4
  SHL r2, r4            ; r2 = py*16
  LDI r4, 23
  ADD r2, r4            ; r2 = py*16+23
  PEEK r8, r2, r15       ; r15 = pixel at wall center
  LDI r4, 0x4466AA
  CMP r15, r4
  JZ r5, idle           ; wall found, block
  CALL save_old_pos
  LDI r6, 0x5311
  LOAD r15, r6
  LDI r4, 1
  ADD r15, r4
  STORE r6, r15
  JMP after_move

try_left:
  LDI r6, 0x5310
  LOAD r8, r6           ; r8 = px
  LDI r6, 0x5311
  LOAD r2, r6           ; r2 = py
  LDI r4, 4
  SHL r8, r4            ; r8 = px*16
  LDI r4, 7
  ADD r8, r4            ; r8 = px*16+7
  LDI r4, 4
  SHL r2, r4            ; r2 = py*16
  LDI r4, 15
  ADD r2, r4            ; r2 = py*16+15
  PEEK r8, r2, r15       ; r15 = pixel at wall center
  LDI r4, 0x4466AA
  CMP r15, r4
  JZ r5, idle           ; wall found, block
  CALL save_old_pos
  LDI r6, 0x5310
  LOAD r15, r6
  LDI r4, 1
  SUB r15, r4
  STORE r6, r15
  JMP after_move

try_right:
  LDI r6, 0x5310
  LOAD r8, r6           ; r8 = px
  LDI r6, 0x5311
  LOAD r2, r6           ; r2 = py
  LDI r4, 4
  SHL r8, r4            ; r8 = px*16
  LDI r4, 23
  ADD r8, r4            ; r8 = px*16+23
  LDI r4, 4
  SHL r2, r4            ; r2 = py*16
  LDI r4, 15
  ADD r2, r4            ; r2 = py*16+15
  PEEK r8, r2, r15       ; r15 = pixel at wall center
  LDI r4, 0x4466AA
  CMP r15, r4
  JZ r5, idle           ; wall found, block
  CALL save_old_pos
  LDI r6, 0x5310
  LOAD r15, r6
  LDI r4, 1
  ADD r15, r4
  STORE r6, r15
  JMP after_move

after_move:
  CALL erase_player
  CALL draw_goal
  CALL draw_player
  ; Check win -- player at (14,14)?
  LDI r6, 0x5310
  LOAD r15, r6
  LDI r6, 0x5311
  LOAD r2, r6
  LDI r4, 14
  CMP r15, r4
  JNZ r5, idle
  CMP r2, r4
  JNZ r5, idle
  LDI r15, 1
  LDI r6, 0x5312
  STORE r6, r15
  ; Play victory sound -- ascending tone
  LDI r9, 440
  LDI r7, 200
  BEEP r9, r7

idle:
  FRAME
  JMP game_loop

; ── Win Screen ───────────────────────────────────────────────────

win_screen:
  LDI r15, 0x003300     ; dark green
  FILL r15
  LDI r12, 0x5320
  LDI r1, 90
  LDI r0, 110
  TEXT r1, r0, r12
  LDI r12, 0x5330
  LDI r1, 90
  LDI r0, 140
  TEXT r1, r0, r12
  FRAME
  IKEY r3
  JZ r3, win_screen
  LDI r7, 82
  CMP r3, r7
  JZ r5, restart
  LDI r7, 114
  CMP r3, r7
  JZ r5, restart
  JMP win_screen

; ─────────────────────────────────────────────────────────────────
; SUBROUTINES
; ─────────────────────────────────────────────────────────────────

; ── init_grid -- set all 31 rows to 0xFFFFFFFF ──────────────────
init_grid:
  LDI r12, 0
ig_loop:
  LDI r6, 0x5000
  ADD r6, r12
  LDI r15, 0xFFFFFFFF
  STORE r6, r15
  LDI r9, 1
  ADD r12, r9
  LDI r7, 31
  CMP r12, r7
  BLT r5, ig_loop
  RET

; ── clear_visited -- zero 225 bytes at 0x5100 ──────────────────
clear_visited:
  LDI r12, 0
cv_loop:
  LDI r6, 0x5100
  ADD r6, r12
  LDI r15, 0
  STORE r6, r15
  LDI r9, 1
  ADD r12, r9
  LDI r7, 225
  CMP r12, r7
  BLT r5, cv_loop
  RET

; ── init_sp -- set dfs stack pointer to 0 ──────────────────────
init_sp:
  LDI r15, 0
  LDI r6, 0x5300
  STORE r6, r15
  RET

; ── init_text -- store text strings in RAM ──────────────────────
init_text:
  ; "YOU WIN!" at 0x5320
  LDI r6, 0x5320
  LDI r15, 89
  STORE r6, r15
  LDI r6, 0x5321
  LDI r15, 79
  STORE r6, r15
  LDI r6, 0x5322
  LDI r15, 85
  STORE r6, r15
  LDI r6, 0x5323
  LDI r15, 32
  STORE r6, r15
  LDI r6, 0x5324
  LDI r15, 87
  STORE r6, r15
  LDI r6, 0x5325
  LDI r15, 73
  STORE r6, r15
  LDI r6, 0x5326
  LDI r15, 78
  STORE r6, r15
  LDI r6, 0x5327
  LDI r15, 33
  STORE r6, r15
  LDI r6, 0x5328
  LDI r15, 0
  STORE r6, r15
  ; "PRESS R" at 0x5330
  LDI r6, 0x5330
  LDI r15, 80
  STORE r6, r15
  LDI r6, 0x5331
  LDI r15, 82
  STORE r6, r15
  LDI r6, 0x5332
  LDI r15, 69
  STORE r6, r15
  LDI r6, 0x5333
  LDI r15, 83
  STORE r6, r15
  LDI r6, 0x5334
  LDI r15, 83
  STORE r6, r15
  LDI r6, 0x5335
  LDI r15, 32
  STORE r6, r15
  LDI r6, 0x5336
  LDI r15, 82
  STORE r6, r15
  LDI r6, 0x5337
  LDI r15, 0
  STORE r6, r15
  RET

; ── generate_maze -- randomized DFS backtracker ─────────────────
; Uses r20=current_gx, r21=current_gy (grid coords, odd values)
; Stack at 0x5200, sp at 0x5300, visited at 0x5100
generate_maze:
  PUSH r31

  LDI r20, 1            ; start at grid (1,1)
  LDI r21, 1

  ; Mark cell (0,0) visited -- visited[0] = 1
  LDI r6, 0x5100
  LDI r15, 1
  STORE r6, r15

  ; Clear starting cell in grid
  CALL clear_grid_pos

dfs_loop:
  ; Random direction offset 0..3
  RAND r25
  LDI r26, 4
  MOD r25, r26
  LDI r27, 0            ; direction counter

try_dir:
  ; direction = (r25 + r27) % 4
  LDI r28, 0
  ADD r28, r25
  ADD r28, r27
  LDI r29, 4
  MOD r28, r29

  ; neighbor = current by default
  LDI r23, 0
  ADD r23, r20
  LDI r24, 0
  ADD r24, r21

  ; 0=north (gy-=2), 1=east (gx+=2), 2=south (gy+=2), 3=west (gx-=2)
  LDI r29, 0
  CMP r28, r29
  JZ r5, d_north
  LDI r29, 1
  CMP r28, r29
  JZ r5, d_east
  LDI r29, 2
  CMP r28, r29
  JZ r5, d_south
  ; 3=west
  LDI r29, 2
  SUB r23, r29
  JMP check_nb

d_north:
  LDI r29, 2
  SUB r24, r29
  JMP check_nb

d_east:
  LDI r29, 2
  ADD r23, r29
  JMP check_nb

d_south:
  LDI r29, 2
  ADD r24, r29

check_nb:
  ; Bounds: 1 <= gx <= 29 and 1 <= gy <= 29
  LDI r29, 1
  CMP r23, r29
  BLT r5, next_d
  LDI r29, 30
  CMP r23, r29
  BGE r5, next_d
  LDI r29, 1
  CMP r24, r29
  BLT r5, next_d
  LDI r29, 30
  CMP r24, r29
  BGE r5, next_d

  ; Check visited -- cell_index = ((gy-1)>>1)*15 + ((gx-1)>>1)
  LDI r28, 0
  ADD r28, r24
  LDI r29, 1
  SUB r28, r29
  LDI r29, 1
  SHR r28, r29
  LDI r29, 15
  MUL r28, r29
  LDI r29, 0
  ADD r29, r23
  LDI r22, 1
  SUB r29, r22
  LDI r22, 1
  SHR r29, r22
  ADD r28, r29

  LDI r6, 0x5100
  ADD r6, r28
  LOAD r15, r6
  JNZ r15, next_d

  ; Found valid unvisited neighbor
  CALL dfs_push

  ; Remove wall between (r20,r21) and (r23,r24)
  ; Wall at ((r20+r23)>>1, (r21+r24)>>1)
  LDI r28, 0
  ADD r28, r20
  ADD r28, r23
  LDI r29, 1
  SHR r28, r29
  LDI r29, 0
  ADD r29, r21
  ADD r29, r24
  LDI r22, 1
  SHR r29, r22

  PUSH r20
  PUSH r21
  LDI r9, 0
  ADD r20, r28
  ADD r21, r29
  CALL clear_grid_pos
  POP r21
  POP r20

  ; Move to neighbor
  LDI r9, 0
  ADD r20, r23
  ADD r21, r24

  ; Mark visited (recompute cell_index)
  LDI r28, 0
  ADD r28, r21
  LDI r29, 1
  SUB r28, r29
  LDI r29, 1
  SHR r28, r29
  LDI r29, 15
  MUL r28, r29
  LDI r29, 0
  ADD r29, r20
  LDI r22, 1
  SUB r29, r22
  LDI r22, 1
  SHR r29, r22
  ADD r28, r29
  LDI r6, 0x5100
  ADD r6, r28
  LDI r15, 1
  STORE r6, r15

  ; Clear new cell in grid
  CALL clear_grid_pos

  JMP dfs_loop

next_d:
  LDI r29, 1
  ADD r27, r29
  LDI r29, 4
  CMP r27, r29
  BLT r5, try_dir

  ; Backtrack
  CALL dfs_pop
  JNZ r15, dfs_done
  LDI r9, 0
  ADD r20, r23
  ADD r21, r24
  JMP dfs_loop

dfs_done:
  POP r31
  RET

; ── dfs_push -- push (r20, r21) to stack ────────────────────────
dfs_push:
  LDI r6, 0x5300
  LOAD r12, r6
  LDI r15, 0
  ADD r15, r20
  LDI r4, 8
  SHL r15, r4
  OR r15, r21
  LDI r6, 0x5200
  ADD r6, r12
  STORE r6, r15
  LDI r6, 0x5300
  LOAD r12, r6
  LDI r4, 1
  ADD r12, r4
  LDI r6, 0x5300
  STORE r6, r12
  RET

; ── dfs_pop -- pop from stack ───────────────────────────────────
; Sets r23=gx, r24=gy. r15=1 if empty.
dfs_pop:
  LDI r6, 0x5300
  LOAD r12, r6
  LDI r4, 0
  CMP r12, r4
  JZ r5, sp_empty
  LDI r4, 1
  SUB r12, r4
  LDI r6, 0x5300
  STORE r6, r12
  LDI r6, 0x5200
  ADD r6, r12
  LOAD r15, r6
  LDI r4, 0xFF
  LDI r23, 0
  ADD r23, r15
  AND r23, r4
  LDI r4, 8
  LDI r24, 0
  ADD r24, r15
  SHR r24, r4
  LDI r15, 0
  RET
sp_empty:
  LDI r15, 1
  RET

; ── clear_grid_pos -- clear bit at (r20, r21) ───────────────────
clear_grid_pos:
  LDI r6, 0x5000
  LDI r4, 4
  LDI r12, 0
  ADD r12, r21
  MUL r12, r4
  ADD r6, r12
  LOAD r15, r6
  LDI r4, 1
  LDI r12, 0
  ADD r12, r20
  SHL r4, r12
  LDI r22, 0xFFFFFFFF
  XOR r4, r22
  AND r15, r4
  LDI r6, 0x5000
  LDI r4, 4
  LDI r12, 0
  ADD r12, r21
  MUL r12, r4
  ADD r6, r12
  STORE r6, r15
  RET

; ── check_wall -- check grid (r8=col, r2=row) for wall ─────────
; Returns r15 = bit value (0=passage, nonzero=wall)
check_wall:
  LDI r6, 0x5000
  LDI r4, 4
  MUL r2, r4
  ADD r6, r2
  LOAD r15, r6
  LDI r4, 1
  SHL r4, r8
  AND r15, r4
  RET

; ── save_old_pos -- save player pos to old ─────────────────────
save_old_pos:
  LDI r6, 0x5310
  LOAD r15, r6
  LDI r6, 0x5313
  STORE r6, r15
  LDI r6, 0x5311
  LOAD r15, r6
  LDI r6, 0x5314
  STORE r6, r15
  RET

; ── render_maze -- draw all wall cells ──────────────────────────
render_maze:
  LDI r15, 0x001020     ; dark background
  FILL r15
  LDI r12, 0            ; gy
rm_row:
  LDI r1, 0            ; gx
rm_col:
  LDI r6, 0x5000
  LDI r4, 4
  LDI r0, 0
  ADD r0, r12
  MUL r0, r4
  ADD r6, r0
  LOAD r15, r6
  LDI r4, 1
  LDI r0, 0
  ADD r0, r1
  SHL r4, r0
  AND r15, r4
  JZ r15, rm_skip
  ; pixel (4 + gx*8, 4 + gy*8)
  LDI r2, 0
  ADD r2, r1
  LDI r4, 8
  MUL r2, r4
  LDI r4, 4
  ADD r2, r4
  LDI r8, 0
  ADD r8, r12
  LDI r4, 8
  MUL r8, r4
  LDI r4, 4
  ADD r8, r4
  LDI r22, 8
  LDI r23, 8
  LDI r24, 0x4466AA    ; blue-gray wall
  RECTF r2, r8, r22, r23, r24
rm_skip:
  LDI r4, 1
  ADD r1, r4
  LDI r4, 31
  CMP r1, r4
  BLT r5, rm_col
  LDI r4, 1
  ADD r12, r4
  LDI r4, 31
  CMP r12, r4
  BLT r5, rm_row
  RET

; ── draw_goal -- green square at cell (14,14) ──────────────────
; Cell (14,14) -> grid (29,29) -> pixel (236, 236)
draw_goal:
  LDI r2, 237
  LDI r8, 237
  LDI r22, 6
  LDI r23, 6
  LDI r24, 0x00CC44
  RECTF r2, r8, r22, r23, r24
  RET

; ── draw_player -- yellow square at current position ────────────
draw_player:
  LDI r6, 0x5310
  LOAD r15, r6
  LDI r6, 0x5311
  LOAD r2, r6
  LDI r4, 2
  MUL r15, r4
  LDI r4, 1
  ADD r15, r4
  LDI r4, 2
  MUL r2, r4
  LDI r4, 1
  ADD r2, r4
  LDI r4, 8
  MUL r15, r4
  LDI r4, 4
  ADD r15, r4
  LDI r4, 1
  ADD r15, r4
  LDI r4, 8
  MUL r2, r4
  LDI r4, 4
  ADD r2, r4
  LDI r4, 1
  ADD r2, r4
  LDI r22, 6
  LDI r23, 6
  LDI r24, 0xCCCC00
  RECTF r15, r2, r22, r23, r24
  RET

; ── erase_player -- draw floor color at old position ────────────
erase_player:
  LDI r6, 0x5313
  LOAD r15, r6
  LDI r6, 0x5314
  LOAD r2, r6
  LDI r4, 2
  MUL r15, r4
  LDI r4, 1
  ADD r15, r4
  LDI r4, 2
  MUL r2, r4
  LDI r4, 1
  ADD r2, r4
  LDI r4, 8
  MUL r15, r4
  LDI r4, 4
  ADD r15, r4
  LDI r4, 1
  ADD r15, r4
  LDI r4, 8
  MUL r2, r4
  LDI r4, 4
  ADD r2, r4
  LDI r4, 1
  ADD r2, r4
  LDI r22, 6
  LDI r23, 6
  LDI r24, 0x001020
  RECTF r15, r2, r22, r23, r24
  RET
