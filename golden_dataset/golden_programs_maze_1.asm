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
  LDI r12, 0
  LDI r7, 0x5310
  STORE r7, r12
  LDI r7, 0x5311
  STORE r7, r12
  LDI r7, 0x5313
  STORE r7, r12           ; old_px = 0
  LDI r7, 0x5314
  STORE r7, r12           ; old_py = 0

  ; won = 0
  LDI r12, 0
  LDI r7, 0x5312
  STORE r7, r12

  ; Render maze, goal, player
  CALL render_maze
  CALL draw_goal
  CALL draw_player

; ── Main Game Loop ───────────────────────────────────────────────

game_loop:
  ; Check win
  LDI r7, 0x5312
  LOAD r12, r7
  JNZ r12, win_screen

  ; Read keyboard
  IKEY r9
  JZ r9, idle           ; no key, just frame

  ; W = up
  LDI r13, 87
  CMP r9, r13
  JZ r14, try_up
  LDI r13, 119
  CMP r9, r13
  JZ r14, try_up

  ; S = down
  LDI r13, 83
  CMP r9, r13
  JZ r14, try_down
  LDI r13, 115
  CMP r9, r13
  JZ r14, try_down

  ; A = left
  LDI r13, 65
  CMP r9, r13
  JZ r14, try_left
  LDI r13, 97
  CMP r9, r13
  JZ r14, try_left

  ; D = right
  LDI r13, 68
  CMP r9, r13
  JZ r14, try_right
  LDI r13, 100
  CMP r9, r13
  JZ r14, try_right

  ; R = restart
  LDI r13, 82
  CMP r9, r13
  JZ r14, restart
  LDI r13, 114
  CMP r9, r13
  JZ r14, restart

  JMP idle

; ── Movement Handlers ────────────────────────────────────────────
; PEEK-based collision detection -- reads screen pixel at wall center
; Wall color 0x4466AA, background 0x001020
; Wall block centers: up(16*px+15, 16*py+7) down(16*px+15, 16*py+23)
;                      left(16*px+7, 16*py+15) right(16*px+23, 16*py+15)

try_up:
  LDI r7, 0x5310
  LOAD r6, r7           ; r6 = px
  LDI r7, 0x5311
  LOAD r5, r7           ; r5 = py
  LDI r15, 4
  SHL r6, r15            ; r6 = px*16
  LDI r15, 15
  ADD r6, r15            ; r6 = px*16+15
  LDI r15, 4
  SHL r5, r15            ; r5 = py*16
  LDI r15, 7
  ADD r5, r15            ; r5 = py*16+7
  PEEK r6, r5, r12       ; r12 = pixel at wall center
  LDI r15, 0x4466AA
  CMP r12, r15
  JZ r14, idle           ; wall found, block
  CALL save_old_pos
  LDI r7, 0x5311
  LOAD r12, r7
  LDI r15, 1
  SUB r12, r15
  STORE r7, r12
  JMP after_move

try_down:
  LDI r7, 0x5310
  LOAD r6, r7           ; r6 = px
  LDI r7, 0x5311
  LOAD r5, r7           ; r5 = py
  LDI r15, 4
  SHL r6, r15            ; r6 = px*16
  LDI r15, 15
  ADD r6, r15            ; r6 = px*16+15
  LDI r15, 4
  SHL r5, r15            ; r5 = py*16
  LDI r15, 23
  ADD r5, r15            ; r5 = py*16+23
  PEEK r6, r5, r12       ; r12 = pixel at wall center
  LDI r15, 0x4466AA
  CMP r12, r15
  JZ r14, idle           ; wall found, block
  CALL save_old_pos
  LDI r7, 0x5311
  LOAD r12, r7
  LDI r15, 1
  ADD r12, r15
  STORE r7, r12
  JMP after_move

try_left:
  LDI r7, 0x5310
  LOAD r6, r7           ; r6 = px
  LDI r7, 0x5311
  LOAD r5, r7           ; r5 = py
  LDI r15, 4
  SHL r6, r15            ; r6 = px*16
  LDI r15, 7
  ADD r6, r15            ; r6 = px*16+7
  LDI r15, 4
  SHL r5, r15            ; r5 = py*16
  LDI r15, 15
  ADD r5, r15            ; r5 = py*16+15
  PEEK r6, r5, r12       ; r12 = pixel at wall center
  LDI r15, 0x4466AA
  CMP r12, r15
  JZ r14, idle           ; wall found, block
  CALL save_old_pos
  LDI r7, 0x5310
  LOAD r12, r7
  LDI r15, 1
  SUB r12, r15
  STORE r7, r12
  JMP after_move

try_right:
  LDI r7, 0x5310
  LOAD r6, r7           ; r6 = px
  LDI r7, 0x5311
  LOAD r5, r7           ; r5 = py
  LDI r15, 4
  SHL r6, r15            ; r6 = px*16
  LDI r15, 23
  ADD r6, r15            ; r6 = px*16+23
  LDI r15, 4
  SHL r5, r15            ; r5 = py*16
  LDI r15, 15
  ADD r5, r15            ; r5 = py*16+15
  PEEK r6, r5, r12       ; r12 = pixel at wall center
  LDI r15, 0x4466AA
  CMP r12, r15
  JZ r14, idle           ; wall found, block
  CALL save_old_pos
  LDI r7, 0x5310
  LOAD r12, r7
  LDI r15, 1
  ADD r12, r15
  STORE r7, r12
  JMP after_move

after_move:
  CALL erase_player
  CALL draw_goal
  CALL draw_player
  ; Check win -- player at (14,14)?
  LDI r7, 0x5310
  LOAD r12, r7
  LDI r7, 0x5311
  LOAD r5, r7
  LDI r15, 14
  CMP r12, r15
  JNZ r14, idle
  CMP r5, r15
  JNZ r14, idle
  LDI r12, 1
  LDI r7, 0x5312
  STORE r7, r12
  ; Play victory sound -- ascending tone
  LDI r3, 440
  LDI r13, 200
  BEEP r3, r13

idle:
  FRAME
  JMP game_loop

; ── Win Screen ───────────────────────────────────────────────────

win_screen:
  LDI r12, 0x003300     ; dark green
  FILL r12
  LDI r4, 0x5320
  LDI r11, 90
  LDI r8, 110
  TEXT r11, r8, r4
  LDI r4, 0x5330
  LDI r11, 90
  LDI r8, 140
  TEXT r11, r8, r4
  FRAME
  IKEY r9
  JZ r9, win_screen
  LDI r13, 82
  CMP r9, r13
  JZ r14, restart
  LDI r13, 114
  CMP r9, r13
  JZ r14, restart
  JMP win_screen

; ─────────────────────────────────────────────────────────────────
; SUBROUTINES
; ─────────────────────────────────────────────────────────────────

; ── init_grid -- set all 31 rows to 0xFFFFFFFF ──────────────────
init_grid:
  LDI r4, 0
ig_loop:
  LDI r7, 0x5000
  ADD r7, r4
  LDI r12, 0xFFFFFFFF
  STORE r7, r12
  LDI r3, 1
  ADD r4, r3
  LDI r13, 31
  CMP r4, r13
  BLT r14, ig_loop
  RET

; ── clear_visited -- zero 225 bytes at 0x5100 ──────────────────
clear_visited:
  LDI r4, 0
cv_loop:
  LDI r7, 0x5100
  ADD r7, r4
  LDI r12, 0
  STORE r7, r12
  LDI r3, 1
  ADD r4, r3
  LDI r13, 225
  CMP r4, r13
  BLT r14, cv_loop
  RET

; ── init_sp -- set dfs stack pointer to 0 ──────────────────────
init_sp:
  LDI r12, 0
  LDI r7, 0x5300
  STORE r7, r12
  RET

; ── init_text -- store text strings in RAM ──────────────────────
init_text:
  ; "YOU WIN!" at 0x5320
  LDI r7, 0x5320
  LDI r12, 89
  STORE r7, r12
  LDI r7, 0x5321
  LDI r12, 79
  STORE r7, r12
  LDI r7, 0x5322
  LDI r12, 85
  STORE r7, r12
  LDI r7, 0x5323
  LDI r12, 32
  STORE r7, r12
  LDI r7, 0x5324
  LDI r12, 87
  STORE r7, r12
  LDI r7, 0x5325
  LDI r12, 73
  STORE r7, r12
  LDI r7, 0x5326
  LDI r12, 78
  STORE r7, r12
  LDI r7, 0x5327
  LDI r12, 33
  STORE r7, r12
  LDI r7, 0x5328
  LDI r12, 0
  STORE r7, r12
  ; "PRESS R" at 0x5330
  LDI r7, 0x5330
  LDI r12, 80
  STORE r7, r12
  LDI r7, 0x5331
  LDI r12, 82
  STORE r7, r12
  LDI r7, 0x5332
  LDI r12, 69
  STORE r7, r12
  LDI r7, 0x5333
  LDI r12, 83
  STORE r7, r12
  LDI r7, 0x5334
  LDI r12, 83
  STORE r7, r12
  LDI r7, 0x5335
  LDI r12, 32
  STORE r7, r12
  LDI r7, 0x5336
  LDI r12, 82
  STORE r7, r12
  LDI r7, 0x5337
  LDI r12, 0
  STORE r7, r12
  RET

; ── generate_maze -- randomized DFS backtracker ─────────────────
; Uses r20=current_gx, r21=current_gy (grid coords, odd values)
; Stack at 0x5200, sp at 0x5300, visited at 0x5100
generate_maze:
  PUSH r31

  LDI r20, 1            ; start at grid (1,1)
  LDI r21, 1

  ; Mark cell (0,0) visited -- visited[0] = 1
  LDI r7, 0x5100
  LDI r12, 1
  STORE r7, r12

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
  JZ r14, d_north
  LDI r29, 1
  CMP r28, r29
  JZ r14, d_east
  LDI r29, 2
  CMP r28, r29
  JZ r14, d_south
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
  BLT r14, next_d
  LDI r29, 30
  CMP r23, r29
  BGE r14, next_d
  LDI r29, 1
  CMP r24, r29
  BLT r14, next_d
  LDI r29, 30
  CMP r24, r29
  BGE r14, next_d

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

  LDI r7, 0x5100
  ADD r7, r28
  LOAD r12, r7
  JNZ r12, next_d

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
  LDI r3, 0
  ADD r20, r28
  ADD r21, r29
  CALL clear_grid_pos
  POP r21
  POP r20

  ; Move to neighbor
  LDI r3, 0
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
  LDI r7, 0x5100
  ADD r7, r28
  LDI r12, 1
  STORE r7, r12

  ; Clear new cell in grid
  CALL clear_grid_pos

  JMP dfs_loop

next_d:
  LDI r29, 1
  ADD r27, r29
  LDI r29, 4
  CMP r27, r29
  BLT r14, try_dir

  ; Backtrack
  CALL dfs_pop
  JNZ r12, dfs_done
  LDI r3, 0
  ADD r20, r23
  ADD r21, r24
  JMP dfs_loop

dfs_done:
  POP r31
  RET

; ── dfs_push -- push (r20, r21) to stack ────────────────────────
dfs_push:
  LDI r7, 0x5300
  LOAD r4, r7
  LDI r12, 0
  ADD r12, r20
  LDI r15, 8
  SHL r12, r15
  OR r12, r21
  LDI r7, 0x5200
  ADD r7, r4
  STORE r7, r12
  LDI r7, 0x5300
  LOAD r4, r7
  LDI r15, 1
  ADD r4, r15
  LDI r7, 0x5300
  STORE r7, r4
  RET

; ── dfs_pop -- pop from stack ───────────────────────────────────
; Sets r23=gx, r24=gy. r12=1 if empty.
dfs_pop:
  LDI r7, 0x5300
  LOAD r4, r7
  LDI r15, 0
  CMP r4, r15
  JZ r14, sp_empty
  LDI r15, 1
  SUB r4, r15
  LDI r7, 0x5300
  STORE r7, r4
  LDI r7, 0x5200
  ADD r7, r4
  LOAD r12, r7
  LDI r15, 0xFF
  LDI r23, 0
  ADD r23, r12
  AND r23, r15
  LDI r15, 8
  LDI r24, 0
  ADD r24, r12
  SHR r24, r15
  LDI r12, 0
  RET
sp_empty:
  LDI r12, 1
  RET

; ── clear_grid_pos -- clear bit at (r20, r21) ───────────────────
clear_grid_pos:
  LDI r7, 0x5000
  LDI r15, 4
  LDI r4, 0
  ADD r4, r21
  MUL r4, r15
  ADD r7, r4
  LOAD r12, r7
  LDI r15, 1
  LDI r4, 0
  ADD r4, r20
  SHL r15, r4
  LDI r22, 0xFFFFFFFF
  XOR r15, r22
  AND r12, r15
  LDI r7, 0x5000
  LDI r15, 4
  LDI r4, 0
  ADD r4, r21
  MUL r4, r15
  ADD r7, r4
  STORE r7, r12
  RET

; ── check_wall -- check grid (r6=col, r5=row) for wall ─────────
; Returns r12 = bit value (0=passage, nonzero=wall)
check_wall:
  LDI r7, 0x5000
  LDI r15, 4
  MUL r5, r15
  ADD r7, r5
  LOAD r12, r7
  LDI r15, 1
  SHL r15, r6
  AND r12, r15
  RET

; ── save_old_pos -- save player pos to old ─────────────────────
save_old_pos:
  LDI r7, 0x5310
  LOAD r12, r7
  LDI r7, 0x5313
  STORE r7, r12
  LDI r7, 0x5311
  LOAD r12, r7
  LDI r7, 0x5314
  STORE r7, r12
  RET

; ── render_maze -- draw all wall cells ──────────────────────────
render_maze:
  LDI r12, 0x001020     ; dark background
  FILL r12
  LDI r4, 0            ; gy
rm_row:
  LDI r11, 0            ; gx
rm_col:
  LDI r7, 0x5000
  LDI r15, 4
  LDI r8, 0
  ADD r8, r4
  MUL r8, r15
  ADD r7, r8
  LOAD r12, r7
  LDI r15, 1
  LDI r8, 0
  ADD r8, r11
  SHL r15, r8
  AND r12, r15
  JZ r12, rm_skip
  ; pixel (4 + gx*8, 4 + gy*8)
  LDI r5, 0
  ADD r5, r11
  LDI r15, 8
  MUL r5, r15
  LDI r15, 4
  ADD r5, r15
  LDI r6, 0
  ADD r6, r4
  LDI r15, 8
  MUL r6, r15
  LDI r15, 4
  ADD r6, r15
  LDI r22, 8
  LDI r23, 8
  LDI r24, 0x4466AA    ; blue-gray wall
  RECTF r5, r6, r22, r23, r24
rm_skip:
  LDI r15, 1
  ADD r11, r15
  LDI r15, 31
  CMP r11, r15
  BLT r14, rm_col
  LDI r15, 1
  ADD r4, r15
  LDI r15, 31
  CMP r4, r15
  BLT r14, rm_row
  RET

; ── draw_goal -- green square at cell (14,14) ──────────────────
; Cell (14,14) -> grid (29,29) -> pixel (236, 236)
draw_goal:
  LDI r5, 237
  LDI r6, 237
  LDI r22, 6
  LDI r23, 6
  LDI r24, 0x00CC44
  RECTF r5, r6, r22, r23, r24
  RET

; ── draw_player -- yellow square at current position ────────────
draw_player:
  LDI r7, 0x5310
  LOAD r12, r7
  LDI r7, 0x5311
  LOAD r5, r7
  LDI r15, 2
  MUL r12, r15
  LDI r15, 1
  ADD r12, r15
  LDI r15, 2
  MUL r5, r15
  LDI r15, 1
  ADD r5, r15
  LDI r15, 8
  MUL r12, r15
  LDI r15, 4
  ADD r12, r15
  LDI r15, 1
  ADD r12, r15
  LDI r15, 8
  MUL r5, r15
  LDI r15, 4
  ADD r5, r15
  LDI r15, 1
  ADD r5, r15
  LDI r22, 6
  LDI r23, 6
  LDI r24, 0xCCCC00
  RECTF r12, r5, r22, r23, r24
  RET

; ── erase_player -- draw floor color at old position ────────────
erase_player:
  LDI r7, 0x5313
  LOAD r12, r7
  LDI r7, 0x5314
  LOAD r5, r7
  LDI r15, 2
  MUL r12, r15
  LDI r15, 1
  ADD r12, r15
  LDI r15, 2
  MUL r5, r15
  LDI r15, 1
  ADD r5, r15
  LDI r15, 8
  MUL r12, r15
  LDI r15, 4
  ADD r12, r15
  LDI r15, 1
  ADD r12, r15
  LDI r15, 8
  MUL r5, r15
  LDI r15, 4
  ADD r5, r15
  LDI r15, 1
  ADD r5, r15
  LDI r22, 6
  LDI r23, 6
  LDI r24, 0x001020
  RECTF r12, r5, r22, r23, r24
  RET
