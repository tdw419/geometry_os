; DESCRIPTION: A red object centered at the screen with fixed size.

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
  LDI r4, 0
  LDI r2, 0x5310
  STORE r2, r4
  LDI r2, 0x5311
  STORE r2, r4
  LDI r2, 0x5313
  STORE r2, r4           ; old_px = 0
  LDI r2, 0x5314
  STORE r2, r4           ; old_py = 0

  ; won = 0
  LDI r4, 0
  LDI r2, 0x5312
  STORE r2, r4

  ; Render maze, goal, player
  CALL render_maze
  CALL draw_goal
  CALL draw_player

; ── Main Game Loop ───────────────────────────────────────────────

game_loop:
  ; Check win
  LDI r2, 0x5312
  LOAD r4, r2
  JNZ r4, win_screen

  ; Read keyboard
  IKEY r9
  JZ r9, idle           ; no key, just frame

  ; W = up
  LDI r12, 87
  CMP r9, r12
  JZ r0, try_up
  LDI r12, 119
  CMP r9, r12
  JZ r0, try_up

  ; S = down
  LDI r12, 83
  CMP r9, r12
  JZ r0, try_down
  LDI r12, 115
  CMP r9, r12
  JZ r0, try_down

  ; A = left
  LDI r12, 65
  CMP r9, r12
  JZ r0, try_left
  LDI r12, 97
  CMP r9, r12
  JZ r0, try_left

  ; D = right
  LDI r12, 68
  CMP r9, r12
  JZ r0, try_right
  LDI r12, 100
  CMP r9, r12
  JZ r0, try_right

  ; R = restart
  LDI r12, 82
  CMP r9, r12
  JZ r0, restart
  LDI r12, 114
  CMP r9, r12
  JZ r0, restart

  JMP idle

; ── Movement Handlers ────────────────────────────────────────────
; PEEK-based collision detection -- reads screen pixel at wall center
; Wall color 0x4466AA, background 0x001020
; Wall block centers: up(16*px+15, 16*py+7) down(16*px+15, 16*py+23)
;                      left(16*px+7, 16*py+15) right(16*px+23, 16*py+15)

try_up:
  LDI r2, 0x5310
  LOAD r15, r2           ; r15 = px
  LDI r2, 0x5311
  LOAD r8, r2           ; r8 = py
  LDI r6, 4
  SHL r15, r6            ; r15 = px*16
  LDI r6, 15
  ADD r15, r6            ; r15 = px*16+15
  LDI r6, 4
  SHL r8, r6            ; r8 = py*16
  LDI r6, 7
  ADD r8, r6            ; r8 = py*16+7
  PEEK r15, r8, r4       ; r4 = pixel at wall center
  LDI r6, 0x4466AA
  CMP r4, r6
  JZ r0, idle           ; wall found, block
  CALL save_old_pos
  LDI r2, 0x5311
  LOAD r4, r2
  LDI r6, 1
  SUB r4, r6
  STORE r2, r4
  JMP after_move

try_down:
  LDI r2, 0x5310
  LOAD r15, r2           ; r15 = px
  LDI r2, 0x5311
  LOAD r8, r2           ; r8 = py
  LDI r6, 4
  SHL r15, r6            ; r15 = px*16
  LDI r6, 15
  ADD r15, r6            ; r15 = px*16+15
  LDI r6, 4
  SHL r8, r6            ; r8 = py*16
  LDI r6, 23
  ADD r8, r6            ; r8 = py*16+23
  PEEK r15, r8, r4       ; r4 = pixel at wall center
  LDI r6, 0x4466AA
  CMP r4, r6
  JZ r0, idle           ; wall found, block
  CALL save_old_pos
  LDI r2, 0x5311
  LOAD r4, r2
  LDI r6, 1
  ADD r4, r6
  STORE r2, r4
  JMP after_move

try_left:
  LDI r2, 0x5310
  LOAD r15, r2           ; r15 = px
  LDI r2, 0x5311
  LOAD r8, r2           ; r8 = py
  LDI r6, 4
  SHL r15, r6            ; r15 = px*16
  LDI r6, 7
  ADD r15, r6            ; r15 = px*16+7
  LDI r6, 4
  SHL r8, r6            ; r8 = py*16
  LDI r6, 15
  ADD r8, r6            ; r8 = py*16+15
  PEEK r15, r8, r4       ; r4 = pixel at wall center
  LDI r6, 0x4466AA
  CMP r4, r6
  JZ r0, idle           ; wall found, block
  CALL save_old_pos
  LDI r2, 0x5310
  LOAD r4, r2
  LDI r6, 1
  SUB r4, r6
  STORE r2, r4
  JMP after_move

try_right:
  LDI r2, 0x5310
  LOAD r15, r2           ; r15 = px
  LDI r2, 0x5311
  LOAD r8, r2           ; r8 = py
  LDI r6, 4
  SHL r15, r6            ; r15 = px*16
  LDI r6, 23
  ADD r15, r6            ; r15 = px*16+23
  LDI r6, 4
  SHL r8, r6            ; r8 = py*16
  LDI r6, 15
  ADD r8, r6            ; r8 = py*16+15
  PEEK r15, r8, r4       ; r4 = pixel at wall center
  LDI r6, 0x4466AA
  CMP r4, r6
  JZ r0, idle           ; wall found, block
  CALL save_old_pos
  LDI r2, 0x5310
  LOAD r4, r2
  LDI r6, 1
  ADD r4, r6
  STORE r2, r4
  JMP after_move

after_move:
  CALL erase_player
  CALL draw_goal
  CALL draw_player
  ; Check win -- player at (14,14)?
  LDI r2, 0x5310
  LOAD r4, r2
  LDI r2, 0x5311
  LOAD r8, r2
  LDI r6, 14
  CMP r4, r6
  JNZ r0, idle
  CMP r8, r6
  JNZ r0, idle
  LDI r4, 1
  LDI r2, 0x5312
  STORE r2, r4
  ; Play victory sound -- ascending tone
  LDI r14, 440
  LDI r12, 200
  BEEP r14, r12

idle:
  FRAME
  JMP game_loop

; ── Win Screen ───────────────────────────────────────────────────

win_screen:
  LDI r4, 0x003300     ; dark green
  FILL r4
  LDI r3, 0x5320
  LDI r5, 90
  LDI r10, 110
  TEXT r5, r10, r3
  LDI r3, 0x5330
  LDI r5, 90
  LDI r10, 140
  TEXT r5, r10, r3
  FRAME
  IKEY r9
  JZ r9, win_screen
  LDI r12, 82
  CMP r9, r12
  JZ r0, restart
  LDI r12, 114
  CMP r9, r12
  JZ r0, restart
  JMP win_screen

; ─────────────────────────────────────────────────────────────────
; SUBROUTINES
; ─────────────────────────────────────────────────────────────────

; ── init_grid -- set all 31 rows to 0xFFFFFFFF ──────────────────
init_grid:
  LDI r3, 0
ig_loop:
  LDI r2, 0x5000
  ADD r2, r3
  LDI r4, 0xFFFFFFFF
  STORE r2, r4
  LDI r14, 1
  ADD r3, r14
  LDI r12, 31
  CMP r3, r12
  BLT r0, ig_loop
  RET

; ── clear_visited -- zero 225 bytes at 0x5100 ──────────────────
clear_visited:
  LDI r3, 0
cv_loop:
  LDI r2, 0x5100
  ADD r2, r3
  LDI r4, 0
  STORE r2, r4
  LDI r14, 1
  ADD r3, r14
  LDI r12, 225
  CMP r3, r12
  BLT r0, cv_loop
  RET

; ── init_sp -- set dfs stack pointer to 0 ──────────────────────
init_sp:
  LDI r4, 0
  LDI r2, 0x5300
  STORE r2, r4
  RET

; ── init_text -- store text strings in RAM ──────────────────────
init_text:
  ; "YOU WIN!" at 0x5320
  LDI r2, 0x5320
  LDI r4, 89
  STORE r2, r4
  LDI r2, 0x5321
  LDI r4, 79
  STORE r2, r4
  LDI r2, 0x5322
  LDI r4, 85
  STORE r2, r4
  LDI r2, 0x5323
  LDI r4, 32
  STORE r2, r4
  LDI r2, 0x5324
  LDI r4, 87
  STORE r2, r4
  LDI r2, 0x5325
  LDI r4, 73
  STORE r2, r4
  LDI r2, 0x5326
  LDI r4, 78
  STORE r2, r4
  LDI r2, 0x5327
  LDI r4, 33
  STORE r2, r4
  LDI r2, 0x5328
  LDI r4, 0
  STORE r2, r4
  ; "PRESS R" at 0x5330
  LDI r2, 0x5330
  LDI r4, 80
  STORE r2, r4
  LDI r2, 0x5331
  LDI r4, 82
  STORE r2, r4
  LDI r2, 0x5332
  LDI r4, 69
  STORE r2, r4
  LDI r2, 0x5333
  LDI r4, 83
  STORE r2, r4
  LDI r2, 0x5334
  LDI r4, 83
  STORE r2, r4
  LDI r2, 0x5335
  LDI r4, 32
  STORE r2, r4
  LDI r2, 0x5336
  LDI r4, 82
  STORE r2, r4
  LDI r2, 0x5337
  LDI r4, 0
  STORE r2, r4
  RET

; ── generate_maze -- randomized DFS backtracker ─────────────────
; Uses r20=current_gx, r21=current_gy (grid coords, odd values)
; Stack at 0x5200, sp at 0x5300, visited at 0x5100
generate_maze:
  PUSH r31

  LDI r20, 1            ; start at grid (1,1)
  LDI r21, 1

  ; Mark cell (0,0) visited -- visited[0] = 1
  LDI r2, 0x5100
  LDI r4, 1
  STORE r2, r4

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
  JZ r0, d_north
  LDI r29, 1
  CMP r28, r29
  JZ r0, d_east
  LDI r29, 2
  CMP r28, r29
  JZ r0, d_south
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
  BLT r0, next_d
  LDI r29, 30
  CMP r23, r29
  BGE r0, next_d
  LDI r29, 1
  CMP r24, r29
  BLT r0, next_d
  LDI r29, 30
  CMP r24, r29
  BGE r0, next_d

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

  LDI r2, 0x5100
  ADD r2, r28
  LOAD r4, r2
  JNZ r4, next_d

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
  LDI r14, 0
  ADD r20, r28
  ADD r21, r29
  CALL clear_grid_pos
  POP r21
  POP r20

  ; Move to neighbor
  LDI r14, 0
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
  LDI r2, 0x5100
  ADD r2, r28
  LDI r4, 1
  STORE r2, r4

  ; Clear new cell in grid
  CALL clear_grid_pos

  JMP dfs_loop

next_d:
  LDI r29, 1
  ADD r27, r29
  LDI r29, 4
  CMP r27, r29
  BLT r0, try_dir

  ; Backtrack
  CALL dfs_pop
  JNZ r4, dfs_done
  LDI r14, 0
  ADD r20, r23
  ADD r21, r24
  JMP dfs_loop

dfs_done:
  POP r31
  RET

; ── dfs_push -- push (r20, r21) to stack ────────────────────────
dfs_push:
  LDI r2, 0x5300
  LOAD r3, r2
  LDI r4, 0
  ADD r4, r20
  LDI r6, 8
  SHL r4, r6
  OR r4, r21
  LDI r2, 0x5200
  ADD r2, r3
  STORE r2, r4
  LDI r2, 0x5300
  LOAD r3, r2
  LDI r6, 1
  ADD r3, r6
  LDI r2, 0x5300
  STORE r2, r3
  RET

; ── dfs_pop -- pop from stack ───────────────────────────────────
; Sets r23=gx, r24=gy. r4=1 if empty.
dfs_pop:
  LDI r2, 0x5300
  LOAD r3, r2
  LDI r6, 0
  CMP r3, r6
  JZ r0, sp_empty
  LDI r6, 1
  SUB r3, r6
  LDI r2, 0x5300
  STORE r2, r3
  LDI r2, 0x5200
  ADD r2, r3
  LOAD r4, r2
  LDI r6, 0xFF
  LDI r23, 0
  ADD r23, r4
  AND r23, r6
  LDI r6, 8
  LDI r24, 0
  ADD r24, r4
  SHR r24, r6
  LDI r4, 0
  RET
sp_empty:
  LDI r4, 1
  RET

; ── clear_grid_pos -- clear bit at (r20, r21) ───────────────────
clear_grid_pos:
  LDI r2, 0x5000
  LDI r6, 4
  LDI r3, 0
  ADD r3, r21
  MUL r3, r6
  ADD r2, r3
  LOAD r4, r2
  LDI r6, 1
  LDI r3, 0
  ADD r3, r20
  SHL r6, r3
  LDI r22, 0xFFFFFFFF
  XOR r6, r22
  AND r4, r6
  LDI r2, 0x5000
  LDI r6, 4
  LDI r3, 0
  ADD r3, r21
  MUL r3, r6
  ADD r2, r3
  STORE r2, r4
  RET

; ── check_wall -- check grid (r15=col, r8=row) for wall ─────────
; Returns r4 = bit value (0=passage, nonzero=wall)
check_wall:
  LDI r2, 0x5000
  LDI r6, 4
  MUL r8, r6
  ADD r2, r8
  LOAD r4, r2
  LDI r6, 1
  SHL r6, r15
  AND r4, r6
  RET

; ── save_old_pos -- save player pos to old ─────────────────────
save_old_pos:
  LDI r2, 0x5310
  LOAD r4, r2
  LDI r2, 0x5313
  STORE r2, r4
  LDI r2, 0x5311
  LOAD r4, r2
  LDI r2, 0x5314
  STORE r2, r4
  RET

; ── render_maze -- draw all wall cells ──────────────────────────
render_maze:
  LDI r4, 0x001020     ; dark background
  FILL r4
  LDI r3, 0            ; gy
rm_row:
  LDI r5, 0            ; gx
rm_col:
  LDI r2, 0x5000
  LDI r6, 4
  LDI r10, 0
  ADD r10, r3
  MUL r10, r6
  ADD r2, r10
  LOAD r4, r2
  LDI r6, 1
  LDI r10, 0
  ADD r10, r5
  SHL r6, r10
  AND r4, r6
  JZ r4, rm_skip
  ; pixel (4 + gx*8, 4 + gy*8)
  LDI r8, 0
  ADD r8, r5
  LDI r6, 8
  MUL r8, r6
  LDI r6, 4
  ADD r8, r6
  LDI r15, 0
  ADD r15, r3
  LDI r6, 8
  MUL r15, r6
  LDI r6, 4
  ADD r15, r6
  LDI r22, 8
  LDI r23, 8
  LDI r24, 0x4466AA    ; blue-gray wall
  RECTF r8, r15, r22, r23, r24
rm_skip:
  LDI r6, 1
  ADD r5, r6
  LDI r6, 31
  CMP r5, r6
  BLT r0, rm_col
  LDI r6, 1
  ADD r3, r6
  LDI r6, 31
  CMP r3, r6
  BLT r0, rm_row
  RET

; ── draw_goal -- green square at cell (14,14) ──────────────────
; Cell (14,14) -> grid (29,29) -> pixel (236, 236)
draw_goal:
  LDI r8, 237
  LDI r15, 237
  LDI r22, 6
  LDI r23, 6
  LDI r24, 0x00CC44
  RECTF r8, r15, r22, r23, r24
  RET

; ── draw_player -- yellow square at current position ────────────
draw_player:
  LDI r2, 0x5310
  LOAD r4, r2
  LDI r2, 0x5311
  LOAD r8, r2
  LDI r6, 2
  MUL r4, r6
  LDI r6, 1
  ADD r4, r6
  LDI r6, 2
  MUL r8, r6
  LDI r6, 1
  ADD r8, r6
  LDI r6, 8
  MUL r4, r6
  LDI r6, 4
  ADD r4, r6
  LDI r6, 1
  ADD r4, r6
  LDI r6, 8
  MUL r8, r6
  LDI r6, 4
  ADD r8, r6
  LDI r6, 1
  ADD r8, r6
  LDI r22, 6
  LDI r23, 6
  LDI r24, 0xCCCC00
  RECTF r4, r8, r22, r23, r24
  RET

; ── erase_player -- draw floor color at old position ────────────
erase_player:
  LDI r2, 0x5313
  LOAD r4, r2
  LDI r2, 0x5314
  LOAD r8, r2
  LDI r6, 2
  MUL r4, r6
  LDI r6, 1
  ADD r4, r6
  LDI r6, 2
  MUL r8, r6
  LDI r6, 1
  ADD r8, r6
  LDI r6, 8
  MUL r4, r6
  LDI r6, 4
  ADD r4, r6
  LDI r6, 1
  ADD r4, r6
  LDI r6, 8
  MUL r8, r6
  LDI r6, 4
  ADD r8, r6
  LDI r6, 1
  ADD r8, r6
  LDI r22, 6
  LDI r23, 6
  LDI r24, 0x001020
  RECTF r4, r8, r22, r23, r24
  RET
