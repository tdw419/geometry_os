; 2048.asm -- 2048 sliding tile puzzle for Geometry OS
;
; Controls:
;   W (87) = slide up     S (83) = slide down
;   A (65) = slide left   D (68) = slide right
;   R (82) = restart
;
; Memory map:
;   0x3000..0x300F  grid[0..15]  (row-major)
;   0x3010          score
;   0x3011          game_over    (0=playing, 1=over, 2=won)
;   0x3012          moved        (flag)
;   0x3013          best_tile
;   0x3014          spawn_count
;   0x3180..0x3183  temp buffer for slide
;   0x3200..0x320C  color lookup (13 entries)
;
; Grid rendering:
;   Grid origin: x=16, y=20
;   Cell size: 56x56, gap 2px
;
; Register conventions:
;   r20 = constant 1
;   r21 = constant 4
;   r22 = constant 16
;   r23 = constant 56 (cell size)
;   r30 = SP (0x8000)
;   r31 = LR

; ── restart / init ──────────────────────────────────────────────
restart:
  LDI r30, 0x8000

  ; clear grid (16 cells)
  LDI r1, 0
  LDI r4, 0x3000
  LDI r5, 16
  LDI r6, 1
clear_grid:
  STORE r4, r1
  ADD r4, r6
  SUB r5, r6
  JNZ r5, clear_grid

  ; init game state
  LDI r1, 0
  LDI r4, 0x3010
  STORE r4, r1
  LDI r4, 0x3011
  STORE r4, r1
  LDI r4, 0x3013
  STORE r4, r1
  LDI r4, 0x3014
  STORE r4, r1

  ; init color lookup table at 0x3200
  LDI r4, 0x3200
  LDI r1, 0x1A1A2E
  STORE r4, r1
  LDI r5, 1
  ADD r4, r5
  LDI r1, 0xEEE4DA
  STORE r4, r1
  ADD r4, r5
  LDI r1, 0xEDE0C8
  STORE r4, r1
  ADD r4, r5
  LDI r1, 0xF2B179
  STORE r4, r1
  ADD r4, r5
  LDI r1, 0xF59563
  STORE r4, r1
  ADD r4, r5
  LDI r1, 0xF67C5F
  STORE r4, r1
  ADD r4, r5
  LDI r1, 0xF65E3B
  STORE r4, r1
  ADD r4, r5
  LDI r1, 0xEDCF72
  STORE r4, r1
  ADD r4, r5
  LDI r1, 0xEDCC61
  STORE r4, r1
  ADD r4, r5
  LDI r1, 0xEDC850
  STORE r4, r1
  ADD r4, r5
  LDI r1, 0xEDC53F
  STORE r4, r1
  ADD r4, r5
  LDI r1, 0xEDC22E
  STORE r4, r1
  ADD r4, r5
  LDI r1, 0x3C3A32
  STORE r4, r1

  ; init constants
  LDI r20, 1
  LDI r21, 4
  LDI r22, 16
  LDI r23, 56

  ; spawn 2 initial tiles
  PUSH r31
  CALL spawn_tile
  CALL spawn_tile
  POP r31

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r4, 0x3011
  LOAD r1, r4
  JZ r1, game_play

  ; game over or won - draw final frame and wait for R
  CALL draw_frame
  FRAME
  IKEY r7
  LDI r6, 82
  CMP r7, r6
  JZ r0, restart
  LDI r6, 114
  CMP r7, r6
  JZ r0, restart
  JMP game_loop

game_play:
  ; draw current state
  CALL draw_frame
  FRAME

  ; read keyboard
  IKEY r7

  ; W = slide up
  LDI r6, 87
  CMP r7, r6
  JZ r0, do_up

  ; S = slide down
  LDI r6, 83
  CMP r7, r6
  JZ r0, do_down

  ; A = slide left
  LDI r6, 65
  CMP r7, r6
  JZ r0, do_left

  ; D = slide right
  LDI r6, 68
  CMP r7, r6
  JZ r0, do_right

  ; R = restart
  LDI r6, 82
  CMP r7, r6
  JZ r0, restart

  JMP game_loop

; ── move handlers ────────────────────────────────────────────────
do_up:
  PUSH r31
  LDI r1, 0
  CALL slide_all
  CALL after_move
  POP r31
  JMP game_loop

do_down:
  PUSH r31
  LDI r1, 1
  CALL slide_all
  CALL after_move
  POP r31
  JMP game_loop

do_left:
  PUSH r31
  LDI r1, 2
  CALL slide_all
  CALL after_move
  POP r31
  JMP game_loop

do_right:
  PUSH r31
  LDI r1, 3
  CALL slide_all
  CALL after_move
  POP r31
  JMP game_loop

; ── after_move: spawn tile if moved, check game over ─────────────
after_move:
  PUSH r31
  LDI r4, 0x3012
  LOAD r1, r4
  JZ r1, am_done

  CALL spawn_tile

  ; check for win
  LDI r4, 0x3013
  LOAD r1, r4
  LDI r6, 2048
  CMP r1, r6
  BLT r0, am_check_over
  ; won
  LDI r1, 2
  LDI r4, 0x3011
  STORE r4, r1
  JMP am_done

am_check_over:
  CALL check_game_over
  LDI r4, 0x3011
  STORE r4, r1

am_done:
  POP r31
  RET

; ── spawn_tile: add a 2 to a random empty cell ──────────────────
spawn_tile:
  ; try random positions up to 64 times
  LDI r10, 64
st_try:
  RAND r11
  LDI r6, 15
  AND r11, r6
  LDI r4, 0x3000
  ADD r4, r11
  LOAD r1, r4
  JZ r1, st_place
  SUB r10, r20
  JNZ r10, st_try
  RET

st_place:
  LDI r1, 2
  LDI r4, 0x3000
  ADD r4, r11
  STORE r4, r1

  ; update best_tile
  LDI r4, 0x3013
  LOAD r6, r4
  CMP r6, r1
  BGE r0, st_skip_best
  STORE r4, r1
st_skip_best:

  ; update spawn_count
  LDI r4, 0x3014
  LOAD r1, r4
  ADD r1, r20
  STORE r4, r1
  RET

; ── slide_all: slide all rows/cols in given direction ────────────
; Input: r1 = direction (0=up, 1=down, 2=left, 3=right)
; Uses temp buffer at 0x3180..0x3183
slide_all:
  ; save direction in r24
  MOV r24, r1

  ; clear moved flag
  LDI r1, 0
  LDI r4, 0x3012
  STORE r4, r1

  ; iterate 4 lines (columns for up/down, rows for left/right)
  LDI r25, 0

sa_outer:
  ; copy 4 grid cells to buffer at 0x3180
  LDI r10, 0x3180
  LDI r11, 0

  ; get source addresses based on direction
  ; dir 0 (up): cells = col, col+4, col+8, col+12
  ; dir 1 (down): cells = col+12, col+8, col+4, col (reversed)
  ; dir 2 (left): cells = row*4, row*4+1, row*4+2, row*4+3
  ; dir 3 (right): cells = row*4+3, row*4+2, row*4+1, row*4 (reversed)

  LDI r1, 0
  CMP r24, r1
  JZ r0, sa_copy_up
  LDI r1, 1
  CMP r24, r1
  JZ r0, sa_copy_down
  LDI r1, 2
  CMP r24, r1
  JZ r0, sa_copy_left
  JMP sa_copy_right

sa_copy_up:
  ; r25 = column index, load grid[col], grid[col+4], grid[col+8], grid[col+12]
  LDI r12, 0x3000
  ADD r12, r25
  LOAD r13, r12
  STORE r10, r13
  ADD r10, r20
  ADD r12, r21
  LOAD r13, r12
  STORE r10, r13
  ADD r10, r20
  ADD r12, r21
  LOAD r13, r12
  STORE r10, r13
  ADD r10, r20
  ADD r12, r21
  LOAD r13, r12
  STORE r10, r13
  JMP sa_process

sa_copy_down:
  ; reversed: grid[col+12], grid[col+8], grid[col+4], grid[col]
  LDI r12, 0x3000
  MOV r13, r25
  ADD r13, r21
  ADD r13, r21
  ADD r13, r21
  ADD r12, r13
  LOAD r14, r12
  STORE r10, r14
  ADD r10, r20
  SUB r12, r21
  LOAD r14, r12
  STORE r10, r14
  ADD r10, r20
  SUB r12, r21
  LOAD r14, r12
  STORE r10, r14
  ADD r10, r20
  SUB r12, r21
  LOAD r14, r12
  STORE r10, r14
  JMP sa_process

sa_copy_left:
  ; r25 = row index, load grid[row*4], grid[row*4+1], grid[row*4+2], grid[row*4+3]
  MOV r12, r25
  MUL r12, r21
  LDI r13, 0x3000
  ADD r12, r13
  LOAD r14, r12
  STORE r10, r14
  ADD r10, r20
  ADD r12, r20
  LOAD r14, r12
  STORE r10, r14
  ADD r10, r20
  ADD r12, r20
  LOAD r14, r12
  STORE r10, r14
  ADD r10, r20
  ADD r12, r20
  LOAD r14, r12
  STORE r10, r14
  JMP sa_process

sa_copy_right:
  ; reversed: grid[row*4+3], grid[row*4+2], grid[row*4+1], grid[row*4]
  MOV r12, r25
  MUL r12, r21
  LDI r13, 0x3000
  ADD r12, r13
  ADD r12, r21
  SUB r12, r20
  LOAD r14, r12
  STORE r10, r14
  ADD r10, r20
  SUB r12, r20
  LOAD r14, r12
  STORE r10, r14
  ADD r10, r20
  SUB r12, r20
  LOAD r14, r12
  STORE r10, r14
  ADD r10, r20
  SUB r12, r20
  LOAD r14, r12
  STORE r10, r14

sa_process:
  ; compact buffer (shift non-zero to front)
  PUSH r31
  LDI r1, 0x3180
  CALL compact_buf
  POP r31

  ; merge adjacent equals
  PUSH r31
  LDI r1, 0x3180
  CALL merge_buf
  POP r31

  ; compact again after merge
  PUSH r31
  LDI r1, 0x3180
  CALL compact_buf
  POP r31

  ; write back from buffer to grid
  ; For reversed directions (down, right), we need to write back in reverse
  LDI r1, 0
  CMP r24, r1
  JZ r0, sa_write_up
  LDI r1, 1
  CMP r24, r1
  JZ r0, sa_write_down
  LDI r1, 2
  CMP r24, r1
  JZ r0, sa_write_left
  JMP sa_write_right

sa_write_up:
  LDI r10, 0x3180
  LDI r12, 0x3000
  ADD r12, r25
  LOAD r13, r10
  STORE r12, r13
  ADD r10, r20
  ADD r12, r21
  LOAD r13, r10
  STORE r12, r13
  ADD r10, r20
  ADD r12, r21
  LOAD r13, r10
  STORE r12, r13
  ADD r10, r20
  ADD r12, r21
  LOAD r13, r10
  STORE r12, r13
  JMP sa_next

sa_write_down:
  ; write back reversed: buf[0]→col+12, buf[1]→col+8, buf[2]→col+4, buf[3]→col
  LDI r10, 0x3180
  LDI r12, 0x3000
  MOV r13, r25
  ADD r13, r21
  ADD r13, r21
  ADD r13, r21
  ADD r12, r13
  LOAD r14, r10
  STORE r12, r14
  ADD r10, r20
  SUB r12, r21
  LOAD r14, r10
  STORE r12, r14
  ADD r10, r20
  SUB r12, r21
  LOAD r14, r10
  STORE r12, r14
  ADD r10, r20
  SUB r12, r21
  LOAD r14, r10
  STORE r12, r14
  JMP sa_next

sa_write_left:
  LDI r10, 0x3180
  MOV r12, r25
  MUL r12, r21
  LDI r13, 0x3000
  ADD r12, r13
  LOAD r14, r10
  STORE r12, r14
  ADD r10, r20
  ADD r12, r20
  LOAD r14, r10
  STORE r12, r14
  ADD r10, r20
  ADD r12, r20
  LOAD r14, r10
  STORE r12, r14
  ADD r10, r20
  ADD r12, r20
  LOAD r14, r10
  STORE r12, r14
  JMP sa_next

sa_write_right:
  ; write back reversed
  LDI r10, 0x3180
  MOV r12, r25
  MUL r12, r21
  LDI r13, 0x3000
  ADD r12, r13
  ADD r12, r21
  SUB r12, r20
  LOAD r14, r10
  STORE r12, r14
  ADD r10, r20
  SUB r12, r20
  LOAD r14, r10
  STORE r12, r14
  ADD r10, r20
  SUB r12, r20
  LOAD r14, r10
  STORE r12, r14
  ADD r10, r20
  SUB r12, r20
  LOAD r14, r10
  STORE r12, r14

sa_next:
  ADD r25, r20
  CMP r25, r21
  BLT r0, sa_outer
  RET

; ── compact_buf: shift non-zero values to front of 4-cell buffer ──
; Input: r1 = buffer base address
compact_buf:
  LDI r10, 0
  LDI r11, 0
cb_loop:
  CMP r11, r21
  BGE r0, cb_fill
  MOV r12, r1
  ADD r12, r11
  LOAD r13, r12
  JZ r13, cb_skip
  MOV r12, r1
  ADD r12, r10
  STORE r12, r13
  ADD r10, r20
cb_skip:
  ADD r11, r20
  JMP cb_loop

cb_fill:
  CMP r10, r21
  BGE r0, cb_done
  MOV r12, r1
  ADD r12, r10
  LDI r13, 0
  STORE r12, r13
  ADD r10, r20
  JMP cb_fill

cb_done:
  RET

; ── merge_buf: merge adjacent equal values in buffer ──────────────
; Input: r1 = buffer base address
merge_buf:
  LDI r10, 0
mb_loop:
  CMP r10, r21
  BGE r0, mb_done
  MOV r12, r1
  ADD r12, r10
  LOAD r13, r12
  ADD r12, r20
  LOAD r14, r12
  JZ r13, mb_skip
  JZ r14, mb_skip
  CMP r13, r14
  JNZ r0, mb_skip

  ; merge: buf[i] = val*2, buf[i+1] = 0
  ADD r13, r13
  MOV r12, r1
  ADD r12, r10
  STORE r12, r13
  ADD r12, r20
  LDI r14, 0
  STORE r12, r14

  ; add to score
  LDI r12, 0x3010
  LOAD r14, r12
  ADD r14, r13
  STORE r12, r14

  ; update best_tile
  LDI r12, 0x3013
  LOAD r14, r12
  CMP r14, r13
  BGE r0, mb_skip_best
  STORE r12, r13
mb_skip_best:

  ; set moved flag
  LDI r12, 1
  LDI r14, 0x3012
  STORE r14, r12

  ; skip next cell (advance by 2 total)
  ADD r10, r20

mb_skip:
  ADD r10, r20
  JMP mb_loop

mb_done:
  RET

; ── check_game_over: returns r1=1 if no moves possible ───────────
check_game_over:
  ; check for empty cells
  LDI r10, 0
cgo_empty:
  CMP r10, r22
  BGE r0, cgo_no_empty
  LDI r11, 0x3000
  ADD r11, r10
  LOAD r12, r11
  JZ r12, cgo_can_move
  ADD r10, r20
  JMP cgo_empty

cgo_no_empty:
  ; check horizontal neighbors
  LDI r10, 0
cgo_horiz:
  CMP r10, r22
  BGE r0, cgo_vert
  ; skip last column
  LDI r11, 3
  AND r11, r10
  LDI r12, 3
  CMP r11, r12
  JZ r0, cgo_horiz_next
  ; compare grid[i] with grid[i+1]
  LDI r11, 0x3000
  ADD r11, r10
  LOAD r12, r11
  ADD r11, r20
  LOAD r13, r11
  CMP r12, r13
  JZ r0, cgo_can_move
cgo_horiz_next:
  ADD r10, r20
  JMP cgo_horiz

cgo_vert:
  ; check vertical neighbors
  LDI r10, 0
cgo_vert_loop:
  CMP r10, r22
  BGE r0, cgo_stuck
  ; skip last row (indices 12-15)
  LDI r11, 12
  CMP r10, r11
  BGE r0, cgo_vert_next
  ; compare grid[i] with grid[i+4]
  LDI r11, 0x3000
  ADD r11, r10
  LOAD r12, r11
  ADD r11, r21
  LOAD r13, r11
  CMP r12, r13
  JZ r0, cgo_can_move
cgo_vert_next:
  ADD r10, r20
  JMP cgo_vert_loop

cgo_can_move:
  LDI r1, 0
  RET

cgo_stuck:
  LDI r1, 1
  RET

; ── draw_frame: render the game ──────────────────────────────────
draw_frame:
  PUSH r31

  ; clear screen to dark background
  LDI r1, 0x0F0F1E
  FILL r1

  ; draw 4x4 grid
  LDI r10, 0
df_row_loop:
  CMP r10, r21
  BGE r0, df_done_grid

  LDI r11, 0
df_col_loop:
  CMP r11, r21
  BGE r0, df_next_row

  ; compute grid index
  MOV r12, r10
  MUL r12, r21
  ADD r12, r11

  ; get tile value
  LDI r13, 0x3000
  ADD r13, r12
  LOAD r14, r13

  ; get color from lookup table
  ; index = log2(value) for value > 0, else 0
  LDI r13, 0
  JZ r14, df_got_color
  ; compute log2(r14) by shifting until 0
  MOV r15, r14
df_log2:
  CMP r15, r20
  JZ r0, df_got_log
  SHR r15, r20
  ADD r13, r20
  JMP df_log2
df_got_log:
  ; r13 = log2(value), get color at 0x3200 + r13
  LDI r15, 0x3200
  ADD r15, r13
  LOAD r14, r15
df_got_color:

  ; compute cell position
  ; x = 16 + col * 56
  MOV r12, r11
  MUL r12, r23
  LDI r13, 16
  ADD r12, r13

  ; y = 20 + row * 56
  MOV r13, r10
  MUL r13, r23
  LDI r15, 20
  ADD r13, r15

  ; draw cell: RECTF x, y, 54, 54, color
  LDI r15, 54
  RECTF r12, r13, r15, r15, r14

  ADD r11, r20
  JMP df_col_loop

df_next_row:
  ADD r10, r20
  JMP df_row_loop

df_done_grid:
  POP r31
  RET
