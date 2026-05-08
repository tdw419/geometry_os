; DESCRIPTION: Display a object using color red at the screen.

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
  LDI r10, 0
  LDI r4, 0x5310
  STORE r4, r10
  LDI r4, 0x5311
  STORE r4, r10
  LDI r4, 0x5313
  STORE r4, r10           ; old_px = 0
  LDI r4, 0x5314
  STORE r4, r10           ; old_py = 0

  ; won = 0
  LDI r10, 0
  LDI r4, 0x5312
  STORE r4, r10

  ; Render maze, goal, player
  CALL render_maze
  CALL draw_goal
  CALL draw_player

; ── Main Game Loop ───────────────────────────────────────────────

game_loop:
  ; Check win
  LDI r4, 0x5312
  LOAD r10, r4
  JNZ r10, win_screen

  ; Read keyboard
  IKEY r0
  JZ r0, idle           ; no key, just frame

  ; W = up
  LDI r8, 87
  CMP r0, r8
  JZ r5, try_up
  LDI r8, 119
  CMP r0, r8
  JZ r5, try_up

  ; S = down
  LDI r8, 83
  CMP r0, r8
  JZ r5, try_down
  LDI r8, 115
  CMP r0, r8
  JZ r5, try_down

  ; A = left
  LDI r8, 65
  CMP r0, r8
  JZ r5, try_left
  LDI r8, 97
  CMP r0, r8
  JZ r5, try_left

  ; D = right
  LDI r8, 68
  CMP r0, r8
  JZ r5, try_right
  LDI r8, 100
  CMP r0, r8
  JZ r5, try_right

  ; R = restart
  LDI r8, 82
  CMP r0, r8
  JZ r5, restart
  LDI r8, 114
  CMP r0, r8
  JZ r5, restart

  JMP idle

; ── Movement Handlers ────────────────────────────────────────────
; PEEK-based collision detection -- reads screen pixel at wall center
; Wall color 0x4466AA, background 0x001020
; Wall block centers: up(16*px+15, 16*py+7) down(16*px+15, 16*py+23)
;                      left(16*px+7, 16*py+15) right(16*px+23, 16*py+15)

try_up:
  LDI r4, 0x5310
  LOAD r7, r4           ; r7 = px
  LDI r4, 0x5311
  LOAD r1, r4           ; r1 = py
  LDI r12, 4
  SHL r7, r12            ; r7 = px*16
  LDI r12, 15
  ADD r7, r12            ; r7 = px*16+15
  LDI r12, 4
  SHL r1, r12            ; r1 = py*16
  LDI r12, 7
  ADD r1, r12            ; r1 = py*16+7
  PEEK r7, r1, r10       ; r10 = pixel at wall center
  LDI r12, 0x4466AA
  CMP r10, r12
  JZ r5, idle           ; wall found, block
  CALL save_old_pos
  LDI r4, 0x5311
  LOAD r10, r4
  LDI r12, 1
  SUB r10, r12
  STORE r4, r10
  JMP after_move

try_down:
  LDI r4, 0x5310
  LOAD r7, r4           ; r7 = px
  LDI r4, 0x5311
  LOAD r1, r4           ; r1 = py
  LDI r12, 4
  SHL r7, r12            ; r7 = px*16
  LDI r12, 15
  ADD r7, r12            ; r7 = px*16+15
  LDI r12, 4
  SHL r1, r12            ; r1 = py*16
  LDI r12, 23
  ADD r1, r12            ; r1 = py*16+23
  PEEK r7, r1, r10       ; r10 = pixel at wall center
  LDI r12, 0x4466AA
  CMP r10, r12
  JZ r5, idle           ; wall found, block
  CALL save_old_pos
  LDI r4, 0x5311
  LOAD r10, r4
  LDI r12, 1
  ADD r10, r12
  STORE r4, r10
  JMP after_move

try_left:
  LDI r4, 0x5310
  LOAD r7, r4           ; r7 = px
  LDI r4, 0x5311
  LOAD r1, r4           ; r1 = py
  LDI r12, 4
  SHL r7, r12            ; r7 = px*16
  LDI r12, 7
  ADD r7, r12            ; r7 = px*16+7
  LDI r12, 4
  SHL r1, r12            ; r1 = py*16
  LDI r12, 15
  ADD r1, r12            ; r1 = py*16+15
  PEEK r7, r1, r10       ; r10 = pixel at wall center
  LDI r12, 0x4466AA
  CMP r10, r12
  JZ r5, idle           ; wall found, block
  CALL save_old_pos
  LDI r4, 0x5310
  LOAD r10, r4
  LDI r12, 1
  SUB r10, r12
  STORE r4, r10
  JMP after_move

try_right:
  LDI r4, 0x5310
  LOAD r7, r4           ; r7 = px
  LDI r4, 0x5311
  LOAD r1, r4           ; r1 = py
  LDI r12, 4
  SHL r7, r12            ; r7 = px*16
  LDI r12, 23
  ADD r7, r12            ; r7 = px*16+23
  LDI r12, 4
  SHL r1, r12            ; r1 = py*16
  LDI r12, 15
  ADD r1, r12            ; r1 = py*16+15
  PEEK r7, r1, r10       ; r10 = pixel at wall center
  LDI r12, 0x4466AA
  CMP r10, r12
  JZ r5, idle           ; wall found, block
  CALL save_old_pos
  LDI r4, 0x5310
  LOAD r10, r4
  LDI r12, 1
  ADD r10, r12
  STORE r4, r10
  JMP after_move

after_move:
  CALL erase_player
  CALL draw_goal
  CALL draw_player
  ; Check win -- player at (14,14)?
  LDI r4, 0x5310
  LOAD r10, r4
  LDI r4, 0x5311
  LOAD r1, r4
  LDI r12, 14
  CMP r10, r12
  JNZ r5, idle
  CMP r1, r12
  JNZ r5, idle
  LDI r10, 1
  LDI r4, 0x5312
  STORE r4, r10
  ; Play victory sound -- ascending tone
  LDI r9, 440
  LDI r8, 200
  BEEP r9, r8

idle:
  FRAME
  JMP game_loop

; ── Win Screen ───────────────────────────────────────────────────

win_screen:
  LDI r10, 0x003300     ; dark green
  FILL r10
  LDI r13, 0x5320
  LDI r15, 90
  LDI r3, 110
  TEXT r15, r3, r13
  LDI r13, 0x5330
  LDI r15, 90
  LDI r3, 140
  TEXT r15, r3, r13
  FRAME
  IKEY r0
  JZ r0, win_screen
  LDI r8, 82
  CMP r0, r8
  JZ r5, restart
  LDI r8, 114
  CMP r0, r8
  JZ r5, restart
  JMP win_screen

; ─────────────────────────────────────────────────────────────────
; SUBROUTINES
; ─────────────────────────────────────────────────────────────────

; ── init_grid -- set all 31 rows to 0xFFFFFFFF ──────────────────
init_grid:
  LDI r13, 0
ig_loop:
  LDI r4, 0x5000
  ADD r4, r13
  LDI r10, 0xFFFFFFFF
  STORE r4, r10
  LDI r9, 1
  ADD r13, r9
  LDI r8, 31
  CMP r13, r8
  BLT r5, ig_loop
  RET

; ── clear_visited -- zero 225 bytes at 0x5100 ──────────────────
clear_visited:
  LDI r13, 0
cv_loop:
  LDI r4, 0x5100
  ADD r4, r13
  LDI r10, 0
  STORE r4, r10
  LDI r9, 1
  ADD r13, r9
  LDI r8, 225
  CMP r13, r8
  BLT r5, cv_loop
  RET

; ── init_sp -- set dfs stack pointer to 0 ──────────────────────
init_sp:
  LDI r10, 0
  LDI r4, 0x5300
  STORE r4, r10
  RET

; ── init_text -- store text strings in RAM ──────────────────────
init_text:
  ; "YOU WIN!" at 0x5320
  LDI r4, 0x5320
  LDI r10, 89
  STORE r4, r10
  LDI r4, 0x5321
  LDI r10, 79
  STORE r4, r10
  LDI r4, 0x5322
  LDI r10, 85
  STORE r4, r10
  LDI r4, 0x5323
  LDI r10, 32
  STORE r4, r10
  LDI r4, 0x5324
  LDI r10, 87
  STORE r4, r10
  LDI r4, 0x5325
  LDI r10, 73
  STORE r4, r10
  LDI r4, 0x5326
  LDI r10, 78
  STORE r4, r10
  LDI r4, 0x5327
  LDI r10, 33
  STORE r4, r10
  LDI r4, 0x5328
  LDI r10, 0
  STORE r4, r10
  ; "PRESS R" at 0x5330
  LDI r4, 0x5330
  LDI r10, 80
  STORE r4, r10
  LDI r4, 0x5331
  LDI r10, 82
  STORE r4, r10
  LDI r4, 0x5332
  LDI r10, 69
  STORE r4, r10
  LDI r4, 0x5333
  LDI r10, 83
  STORE r4, r10
  LDI r4, 0x5334
  LDI r10, 83
  STORE r4, r10
  LDI r4, 0x5335
  LDI r10, 32
  STORE r4, r10
  LDI r4, 0x5336
  LDI r10, 82
  STORE r4, r10
  LDI r4, 0x5337
  LDI r10, 0
  STORE r4, r10
  RET

; ── generate_maze -- randomized DFS backtracker ─────────────────
; Uses r20=current_gx, r21=current_gy (grid coords, odd values)
; Stack at 0x5200, sp at 0x5300, visited at 0x5100
generate_maze:
  PUSH r31

  LDI r20, 1            ; start at grid (1,1)
  LDI r21, 1

  ; Mark cell (0,0) visited -- visited[0] = 1
  LDI r4, 0x5100
  LDI r10, 1
  STORE r4, r10

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

  LDI r4, 0x5100
  ADD r4, r28
  LOAD r10, r4
  JNZ r10, next_d

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
  LDI r4, 0x5100
  ADD r4, r28
  LDI r10, 1
  STORE r4, r10

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
  JNZ r10, dfs_done
  LDI r9, 0
  ADD r20, r23
  ADD r21, r24
  JMP dfs_loop

dfs_done:
  POP r31
  RET

; ── dfs_push -- push (r20, r21) to stack ────────────────────────
dfs_push:
  LDI r4, 0x5300
  LOAD r13, r4
  LDI r10, 0
  ADD r10, r20
  LDI r12, 8
  SHL r10, r12
  OR r10, r21
  LDI r4, 0x5200
  ADD r4, r13
  STORE r4, r10
  LDI r4, 0x5300
  LOAD r13, r4
  LDI r12, 1
  ADD r13, r12
  LDI r4, 0x5300
  STORE r4, r13
  RET

; ── dfs_pop -- pop from stack ───────────────────────────────────
; Sets r23=gx, r24=gy. r10=1 if empty.
dfs_pop:
  LDI r4, 0x5300
  LOAD r13, r4
  LDI r12, 0
  CMP r13, r12
  JZ r5, sp_empty
  LDI r12, 1
  SUB r13, r12
  LDI r4, 0x5300
  STORE r4, r13
  LDI r4, 0x5200
  ADD r4, r13
  LOAD r10, r4
  LDI r12, 0xFF
  LDI r23, 0
  ADD r23, r10
  AND r23, r12
  LDI r12, 8
  LDI r24, 0
  ADD r24, r10
  SHR r24, r12
  LDI r10, 0
  RET
sp_empty:
  LDI r10, 1
  RET

; ── clear_grid_pos -- clear bit at (r20, r21) ───────────────────
clear_grid_pos:
  LDI r4, 0x5000
  LDI r12, 4
  LDI r13, 0
  ADD r13, r21
  MUL r13, r12
  ADD r4, r13
  LOAD r10, r4
  LDI r12, 1
  LDI r13, 0
  ADD r13, r20
  SHL r12, r13
  LDI r22, 0xFFFFFFFF
  XOR r12, r22
  AND r10, r12
  LDI r4, 0x5000
  LDI r12, 4
  LDI r13, 0
  ADD r13, r21
  MUL r13, r12
  ADD r4, r13
  STORE r4, r10
  RET

; ── check_wall -- check grid (r7=col, r1=row) for wall ─────────
; Returns r10 = bit value (0=passage, nonzero=wall)
check_wall:
  LDI r4, 0x5000
  LDI r12, 4
  MUL r1, r12
  ADD r4, r1
  LOAD r10, r4
  LDI r12, 1
  SHL r12, r7
  AND r10, r12
  RET

; ── save_old_pos -- save player pos to old ─────────────────────
save_old_pos:
  LDI r4, 0x5310
  LOAD r10, r4
  LDI r4, 0x5313
  STORE r4, r10
  LDI r4, 0x5311
  LOAD r10, r4
  LDI r4, 0x5314
  STORE r4, r10
  RET

; ── render_maze -- draw all wall cells ──────────────────────────
render_maze:
  LDI r10, 0x001020     ; dark background
  FILL r10
  LDI r13, 0            ; gy
rm_row:
  LDI r15, 0            ; gx
rm_col:
  LDI r4, 0x5000
  LDI r12, 4
  LDI r3, 0
  ADD r3, r13
  MUL r3, r12
  ADD r4, r3
  LOAD r10, r4
  LDI r12, 1
  LDI r3, 0
  ADD r3, r15
  SHL r12, r3
  AND r10, r12
  JZ r10, rm_skip
  ; pixel (4 + gx*8, 4 + gy*8)
  LDI r1, 0
  ADD r1, r15
  LDI r12, 8
  MUL r1, r12
  LDI r12, 4
  ADD r1, r12
  LDI r7, 0
  ADD r7, r13
  LDI r12, 8
  MUL r7, r12
  LDI r12, 4
  ADD r7, r12
  LDI r22, 8
  LDI r23, 8
  LDI r24, 0x4466AA    ; blue-gray wall
  RECTF r1, r7, r22, r23, r24
rm_skip:
  LDI r12, 1
  ADD r15, r12
  LDI r12, 31
  CMP r15, r12
  BLT r5, rm_col
  LDI r12, 1
  ADD r13, r12
  LDI r12, 31
  CMP r13, r12
  BLT r5, rm_row
  RET

; ── draw_goal -- green square at cell (14,14) ──────────────────
; Cell (14,14) -> grid (29,29) -> pixel (236, 236)
draw_goal:
  LDI r1, 237
  LDI r7, 237
  LDI r22, 6
  LDI r23, 6
  LDI r24, 0x00CC44
  RECTF r1, r7, r22, r23, r24
  RET

; ── draw_player -- yellow square at current position ────────────
draw_player:
  LDI r4, 0x5310
  LOAD r10, r4
  LDI r4, 0x5311
  LOAD r1, r4
  LDI r12, 2
  MUL r10, r12
  LDI r12, 1
  ADD r10, r12
  LDI r12, 2
  MUL r1, r12
  LDI r12, 1
  ADD r1, r12
  LDI r12, 8
  MUL r10, r12
  LDI r12, 4
  ADD r10, r12
  LDI r12, 1
  ADD r10, r12
  LDI r12, 8
  MUL r1, r12
  LDI r12, 4
  ADD r1, r12
  LDI r12, 1
  ADD r1, r12
  LDI r22, 6
  LDI r23, 6
  LDI r24, 0xCCCC00
  RECTF r10, r1, r22, r23, r24
  RET

; ── erase_player -- draw floor color at old position ────────────
erase_player:
  LDI r4, 0x5313
  LOAD r10, r4
  LDI r4, 0x5314
  LOAD r1, r4
  LDI r12, 2
  MUL r10, r12
  LDI r12, 1
  ADD r10, r12
  LDI r12, 2
  MUL r1, r12
  LDI r12, 1
  ADD r1, r12
  LDI r12, 8
  MUL r10, r12
  LDI r12, 4
  ADD r10, r12
  LDI r12, 1
  ADD r10, r12
  LDI r12, 8
  MUL r1, r12
  LDI r12, 4
  ADD r1, r12
  LDI r12, 1
  ADD r1, r12
  LDI r22, 6
  LDI r23, 6
  LDI r24, 0x001020
  RECTF r10, r1, r22, r23, r24
  RET
