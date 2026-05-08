; DESCRIPTION: Render a colored line at the screen.

; tetris.asm -- Tetris for Geometry OS
;
; Controls:
;   A / D          -- move piece left / right
;   W              -- rotate piece clockwise
;   S              -- soft drop (faster fall)
;   Space          -- hard drop (instant)
;   R              -- restart
;
; Layout (256x256 screen):
;   Play area: 10 cols x 20 rows, 12px per cell = 120x240
;   Left margin: 10px, top margin: 8px
;   Right panel: score + next piece preview
;
; Memory map:
;   0x4000..0x409F  board[0..159]  (10*20 cells, 0=empty, color=occupied)
;   0x40D0          current_piece  (index 0-6)
;   0x40D1          piece_x        (column 0-9)
;   0x40D2          piece_y        (row 0-19, from top)
;   0x40D3          piece_rot      (0-3)
;   0x40D4          score
;   0x40D5          lines_cleared
;   0x40D6          game_over      (0=play, 1=over)
;   0x40D7          next_piece     (index 0-6)
;   0x40D8          soft_drop      (0=normal, 1=soft drop active)
;   0x40D9          drop_counter   (counts frames for auto-drop)
;
; Tetromino data at 0x4100:
;   Each piece has 4 rotations x 4 bytes = 16 bytes
;   7 pieces = 112 bytes total
;   Each byte is a row of the 4x4 bounding box, LSB = leftmost
;
;   0=I, 1=O, 2=T, 3=S, 4=Z, 5=L, 6=J
;
;   Piece 0 (I): horizontal bar
;     rot0: ....  rot1: .X..  rot2: ....  rot3: ..X.
;           ....        .X..        ....        ..X.
;           XXXX        .X..        ....        ..X.
;           ....        .X..        XXXX        ..X.
;
;   Piece 1 (O): square
;     all rotations: .XX.
;                    .XX.
;                    ....
;                    ....
;
;   Piece 2 (T):
;     rot0: .X.  rot1: .X.  rot2: ....  rot3: X..
;           XXX        .XX        XXX        .X.
;           ....        .X.        .X.        .XX
;           ....        ....        ....        ....
;
;   Piece 3 (S):
;     rot0: .XX  rot1: .X.  rot2: ....  rot3: X..
;           XX.        .XX        .XX.        XX.
;           ....        ..X        XX..        .X.
;           ....        ....        ....        ....
;
;   Piece 4 (Z):
;     rot0: XX.  rot1: ..X  rot2: ....  rot3: .XX
;           .XX        .XX        .XX.        XX.
;           ....        .X.        ..XX        .X.
;           ....        ....        ....        ....
;
;   Piece 5 (L):
;     rot0: ..X  rot1: .X.  rot2: ....  rot3: .X.
;           ..X        .X.        XXX.        .X.
;           .XX        .XX        X...        .XX
;           ....        ....        ....        ....
;
;   Piece 6 (J):
;     rot0: X..  rot1: XX.  rot2: ....  rot3: .XX
;           X..        .X.        X...        .X.
;           XX.        .X.        .XXX        .X.
;           ....        ....        ....        ....

; ── Constants ──────────────────────────────────────────────────────
; COLS=10, ROWS=20, CELL=12
; BOARD_BASE=0x4000, PIECE_DATA=0x4100
; Play area pixel origin: (10, 8)

; ── Piece data initialization ──────────────────────────────────────
; We write piece data at runtime since we can't do complex immediate writes


restart:
  LDI r30, 0x8000       ; stack pointer

  CALL init_pieces
  CALL init_colors

  ; clear board
  LDI r4, 0
  LDI r8, 160          ; 10 * 20 = 200 cells... wait, 10*20=200
  ; actually 10 cols * 20 rows = 200
clear_board:
  LDI r0, 0x4000
  ADD r0, r4
  LDI r14, 0
  STORE r0, r14
  LDI r12, 1
  ADD r4, r12
  LDI r15, 200
  CMP r4, r15
  BLT r6, clear_board

  ; reset game state
  LDI r14, 0
  LDI r0, 0x40D4
  STORE r0, r14           ; score = 0
  LDI r14, 0
  LDI r0, 0x40D5
  STORE r0, r14           ; lines_cleared = 0
  LDI r14, 0
  LDI r0, 0x40D6
  STORE r0, r14           ; game_over = 0
  LDI r14, 0
  LDI r0, 0x40D8
  STORE r0, r14           ; soft_drop = 0
  LDI r14, 0
  LDI r0, 0x40D9
  STORE r0, r14           ; drop_counter = 0
  LDI r14, 0
  LDI r0, 0x40DA
  STORE r0, r14           ; level = 0

  ; pick first and next piece
  RAND r14
  LDI r7, 7
  MOD r14, r7
  LDI r0, 0x40D7
  STORE r0, r14           ; next_piece
  CALL spawn_piece
  JMP game_loop

; ── main loop ──────────────────────────────────────────────────────

init_pieces:
  ; Piece 0 (I)
  ; rot0: rows 0,1,2,3 = 0,0,15,0 (XXXX in row 2)
  LDI r0, 0x4100
  LDI r14, 0
  STORE r0, r14
  LDI r0, 0x4101
  LDI r14, 0
  STORE r0, r14
  LDI r0, 0x4102
  LDI r14, 15
  STORE r0, r14
  LDI r0, 0x4103
  LDI r14, 0
  STORE r0, r14
  ; rot1: rows = 4,4,4,4 (.X.. each row = 0100 = 4)
  LDI r0, 0x4104
  LDI r14, 4
  STORE r0, r14
  LDI r0, 0x4105
  LDI r14, 4
  STORE r0, r14
  LDI r0, 0x4106
  LDI r14, 4
  STORE r0, r14
  LDI r0, 0x4107
  LDI r14, 4
  STORE r0, r14
  ; rot2: rows = 0,0,15,0
  LDI r0, 0x4108
  LDI r14, 0
  STORE r0, r14
  LDI r0, 0x4109
  LDI r14, 0
  STORE r0, r14
  LDI r0, 0x410A
  LDI r14, 15
  STORE r0, r14
  LDI r0, 0x410B
  LDI r14, 0
  STORE r0, r14
  ; rot3: rows = 2,2,2,2 (..X. = 0010 = 2)
  LDI r0, 0x410C
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x410D
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x410E
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x410F
  LDI r14, 2
  STORE r0, r14

  ; Piece 1 (O)
  ; all rotations: 6,6,0,0 (.XX. = 0110 = 6)
  LDI r4, 0x4140
ip_o_loop:
  LDI r14, 6
  STORE r4, r14
  LDI r12, 1
  ADD r4, r12
  LDI r14, 6
  STORE r4, r14
  LDI r12, 1
  ADD r4, r12
  LDI r14, 0
  STORE r4, r14
  LDI r12, 1
  ADD r4, r12
  LDI r14, 0
  STORE r4, r14
  LDI r12, 1
  ADD r4, r12
  LDI r15, 0x4160
  CMP r4, r15
  BLT r6, ip_o_loop

  ; Piece 2 (T)
  ; rot0: 2,7,0,0 (.X. XXX .... ....)
  LDI r0, 0x4180
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x4181
  LDI r14, 7
  STORE r0, r14
  LDI r0, 0x4282
  LDI r14, 0
  STORE r0, r14
  LDI r0, 0x4283
  LDI r14, 0
  STORE r0, r14
  ; rot1: 2,3,2,0 (.X. .XX .X. ....)
  LDI r0, 0x4284
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x4285
  LDI r14, 3
  STORE r0, r14
  LDI r0, 0x4286
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x4287
  LDI r14, 0
  STORE r0, r14
  ; rot2: 0,7,2,0 (.... XXX .X. ....)
  LDI r0, 0x4288
  LDI r14, 0
  STORE r0, r14
  LDI r0, 0x4289
  LDI r14, 7
  STORE r0, r14
  LDI r0, 0x428A
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x428B
  LDI r14, 0
  STORE r0, r14
  ; rot3: 2,6,2,0 (X.. .XX .X. ....)
  LDI r0, 0x428C
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x428D
  LDI r14, 6
  STORE r0, r14
  LDI r0, 0x428E
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x428F
  LDI r14, 0
  STORE r0, r14

  ; Piece 3 (S)
  ; rot0: 3,3,0,0  (..XX .XX. .... ....) -- wait let me recalculate
  ; .XX. = 0110 = 6, XX.. = 1100 = 12
  ; rot0: 6,3,0,0
  LDI r0, 0x41C0
  LDI r14, 6
  STORE r0, r14
  LDI r0, 0x41C1
  LDI r14, 3
  STORE r0, r14
  LDI r0, 0x41C2
  LDI r14, 0
  STORE r0, r14
  LDI r0, 0x41C3
  LDI r14, 0
  STORE r0, r14
  ; rot1: 2,3,1,0  (.X. .XX ..X. ....)
  LDI r0, 0x41C4
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x41C5
  LDI r14, 3
  STORE r0, r14
  LDI r0, 0x41C6
  LDI r14, 1
  STORE r0, r14
  LDI r0, 0x41C7
  LDI r14, 0
  STORE r0, r14
  ; rot2: 0,6,3,0  (.... .XX. ..XX ....)
  LDI r0, 0x41C8
  LDI r14, 0
  STORE r0, r14
  LDI r0, 0x41C9
  LDI r14, 6
  STORE r0, r14
  LDI r0, 0x41CA
  LDI r14, 3
  STORE r0, r14
  LDI r0, 0x41CB
  LDI r14, 0
  STORE r0, r14
  ; rot3: 2,6,4,0  (X.. .XX XX.. ....)
  LDI r0, 0x41CC
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x41CD
  LDI r14, 6
  STORE r0, r14
  LDI r0, 0x41CE
  LDI r14, 4
  STORE r0, r14
  LDI r0, 0x41CF
  LDI r14, 0
  STORE r0, r14

  ; Piece 4 (Z)
  ; rot0: 3,6,0,0  (..XX .XX. .... ....)
  LDI r0, 0x4300
  LDI r14, 3
  STORE r0, r14
  LDI r0, 0x4301
  LDI r14, 6
  STORE r0, r14
  LDI r0, 0x4302
  LDI r14, 0
  STORE r0, r14
  LDI r0, 0x4303
  LDI r14, 0
  STORE r0, r14
  ; rot1: 1,3,2,0  (..X. .XX. .X.. ....)
  LDI r0, 0x4304
  LDI r14, 1
  STORE r0, r14
  LDI r0, 0x4305
  LDI r14, 3
  STORE r0, r14
  LDI r0, 0x4306
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x4307
  LDI r14, 0
  STORE r0, r14
  ; rot2: 0,3,6,0  (.... ..XX .XX. ....)
  LDI r0, 0x4308
  LDI r14, 0
  STORE r0, r14
  LDI r0, 0x4309
  LDI r14, 3
  STORE r0, r14
  LDI r0, 0x430A
  LDI r14, 6
  STORE r0, r14
  LDI r0, 0x430B
  LDI r14, 0
  STORE r0, r14
  ; rot3: 4,6,2,0  (XX.. .XX. .X.. ....)
  LDI r0, 0x420C
  LDI r14, 4
  STORE r0, r14
  LDI r0, 0x420D
  LDI r14, 6
  STORE r0, r14
  LDI r0, 0x420E
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x420F
  LDI r14, 0
  STORE r0, r14

  ; Piece 5 (L)
  ; rot0: 1,1,3,0  (X.. X.. .XX. ....)
  LDI r0, 0x4240
  LDI r14, 1
  STORE r0, r14
  LDI r0, 0x4241
  LDI r14, 1
  STORE r0, r14
  LDI r0, 0x4242
  LDI r14, 3
  STORE r0, r14
  LDI r0, 0x4243
  LDI r14, 0
  STORE r0, r14
  ; rot1: 2,2,6,0  (.X. .X. .XX. ....)
  LDI r0, 0x4244
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x4245
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x4246
  LDI r14, 6
  STORE r0, r14
  LDI r0, 0x4247
  LDI r14, 0
  STORE r0, r14
  ; rot2: 0,7,4,0  (.... XXX. XX.. ....)
  LDI r0, 0x4248
  LDI r14, 0
  STORE r0, r14
  LDI r0, 0x4249
  LDI r14, 7
  STORE r0, r14
  LDI r0, 0x424A
  LDI r14, 4
  STORE r0, r14
  LDI r0, 0x424B
  LDI r14, 0
  STORE r0, r14
  ; rot3: 2,6,2,0  (.X. .XX. .X. ....)
  LDI r0, 0x424C
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x424D
  LDI r14, 6
  STORE r0, r14
  LDI r0, 0x424E
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x424F
  LDI r14, 0
  STORE r0, r14

  ; Piece 6 (J)
  ; rot0: 4,4,6,0  (XX.. XX.. .XX. ....)
  LDI r0, 0x4280
  LDI r14, 4
  STORE r0, r14
  LDI r0, 0x4281
  LDI r14, 4
  STORE r0, r14
  LDI r0, 0x4182
  LDI r14, 6
  STORE r0, r14
  LDI r0, 0x4183
  LDI r14, 0
  STORE r0, r14
  ; rot1: 6,2,2,0  (.XX. .X.. .X.. ....)
  LDI r0, 0x4184
  LDI r14, 6
  STORE r0, r14
  LDI r0, 0x4185
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x4186
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x4187
  LDI r14, 0
  STORE r0, r14
  ; rot2: 0,7,1,0  (.... .XXX ..X. ....)
  LDI r0, 0x4188
  LDI r14, 0
  STORE r0, r14
  LDI r0, 0x4189
  LDI r14, 7
  STORE r0, r14
  LDI r0, 0x418A
  LDI r14, 1
  STORE r0, r14
  LDI r0, 0x418B
  LDI r14, 0
  STORE r0, r14
  ; rot3: 2,6,4,0  (.X. .XX. XX.. ....)
  LDI r0, 0x418C
  LDI r14, 2
  STORE r0, r14
  LDI r0, 0x418D
  LDI r14, 6
  STORE r0, r14
  LDI r0, 0x418E
  LDI r14, 4
  STORE r0, r14
  LDI r0, 0x418F
  LDI r14, 0
  STORE r0, r14

  RET

; ── Piece colors (stored at 0x42C0, one per piece) ────────────────
; 0=I cyan, 1=O yellow, 2=T purple, 3=S green, 4=Z red, 5=L orange, 6=J blue
init_colors:
  LDI r0, 0x42C0
  LDI r14, 0x00CCCC     ; I - cyan
  STORE r0, r14
  LDI r0, 0x42C1
  LDI r14, 0xCCCC00     ; O - yellow
  STORE r0, r14
  LDI r0, 0x42C2
  LDI r14, 0xAA00CC     ; T - purple
  STORE r0, r14
  LDI r0, 0x42C3
  LDI r14, 0x00CC44     ; S - green
  STORE r0, r14
  LDI r0, 0x42C4
  LDI r14, 0xCC2200     ; Z - red
  STORE r0, r14
  LDI r0, 0x42C5
  LDI r14, 0xFF8800     ; L - orange
  STORE r0, r14
  LDI r0, 0x42C6
  LDI r14, 0x2244CC     ; J - blue
  STORE r0, r14
  RET

; ── init / restart ─────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r0, 0x40D6
  LOAD r14, r0
  JNZ r14, game_over_screen

  ; read keyboard
  IKEY r10

  ; A/a = move left
  LDI r15, 65
  CMP r10, r15
  JZ r6, do_left
  LDI r15, 97
  CMP r10, r15
  JZ r6, do_left

  ; D/d = move right
  LDI r15, 68
  CMP r10, r15
  JZ r6, do_right
  LDI r15, 100
  CMP r10, r15
  JZ r6, do_right

  ; W/w = rotate
  LDI r15, 87
  CMP r10, r15
  JZ r6, do_rotate
  LDI r15, 119
  CMP r10, r15
  JZ r6, do_rotate

  ; S/s = soft drop
  LDI r15, 83
  CMP r10, r15
  JZ r6, do_soft_drop
  LDI r15, 115
  CMP r10, r15
  JZ r6, do_soft_drop

  ; Space = hard drop
  LDI r15, 32
  CMP r10, r15
  JZ r6, do_hard_drop

  ; R/r = restart
  LDI r15, 82
  CMP r10, r15
  JZ r6, restart
  LDI r15, 114
  CMP r10, r15
  JZ r6, restart

after_input:
  ; auto-drop: check tick counter
  ; Normal speed: drop every 15 frames. Soft drop: every 3 frames.
  LDI r0, 0x40D9
  LOAD r14, r0           ; drop_counter
  LDI r12, 1
  ADD r14, r12
  LDI r0, 0x40D9
  STORE r0, r14

  ; check threshold
  LDI r0, 0x40D8
  LOAD r7, r0           ; soft_drop flag
  JNZ r7, soft_thresh
  
  ; normal threshold based on level: max(2, 15 - level)
  LDI r0, 0x40DA
  LOAD r2, r0           ; r2 = level
  LDI r15, 15
  SUB r15, r2            ; r15 = 15 - level
  
  ; clamp at 2
  LDI r10, 2
  CMP r15, r10
  BGE r6, speed_ok
  LDI r15, 2
speed_ok:
  LDI r0, 0x40D9
  LOAD r14, r0
  CMP r14, r15
  BLT r6, no_drop
  JMP do_drop
soft_thresh:
  LDI r0, 0x40D9
  LOAD r14, r0
  LDI r15, 3
  CMP r14, r15
  BLT r6, no_drop
do_drop:
  LDI r14, 0
  LDI r0, 0x40D9
  STORE r0, r14           ; reset counter
  CALL try_move_down
  JMP draw_and_loop
no_drop:
  JMP draw_and_loop

; ── input handlers ─────────────────────────────────────────────────
do_left:
  PUSH r31
  LDI r0, 0x40D1
  LOAD r14, r0           ; piece_x
  LDI r12, 1
  SUB r14, r12
  ; try at new position
  LDI r0, 0x40D1
  STORE r0, r14
  CALL check_collision
  JNZ r14, left_ok       ; no collision, keep move
  ; collision: revert
  LDI r0, 0x40D1
  LOAD r14, r0
  LDI r12, 1
  ADD r14, r12
  LDI r0, 0x40D1
  STORE r0, r14
left_ok:
  ; move sound
  LDI r12, 440
  LDI r15, 20
  BEEP r12, r15
  POP r31
  JMP after_input

do_right:
  PUSH r31
  LDI r0, 0x40D1
  LOAD r14, r0
  LDI r12, 1
  ADD r14, r12
  LDI r0, 0x40D1
  STORE r0, r14
  CALL check_collision
  JNZ r14, right_ok
  ; revert
  LDI r0, 0x40D1
  LOAD r14, r0
  LDI r12, 1
  SUB r14, r12
  LDI r0, 0x40D1
  STORE r0, r14
right_ok:
  ; move sound
  LDI r12, 440
  LDI r15, 20
  BEEP r12, r15
  POP r31
  JMP after_input

do_rotate:
  PUSH r31
  LDI r0, 0x40D3
  LOAD r14, r0           ; piece_rot
  LDI r12, 1
  ADD r14, r12
  LDI r15, 4
  MOD r14, r15
  LDI r0, 0x40D3
  STORE r0, r14
  CALL check_collision
  JNZ r14, rot_ok
  ; revert rotation
  LDI r0, 0x40D3
  LOAD r14, r0
  LDI r12, 3
  ADD r14, r12
  LDI r15, 4
  MOD r14, r15
  LDI r0, 0x40D3
  STORE r0, r14
rot_ok:
  ; rotate sound
  LDI r12, 660
  LDI r15, 20
  BEEP r12, r15
  POP r31
  JMP after_input

do_soft_drop:
  LDI r14, 1
  LDI r0, 0x40D8
  STORE r0, r14
  JMP after_input

do_hard_drop:
  PUSH r31
  ; hard drop sound (start)
  LDI r12, 440
  LDI r15, 50
  BEEP r12, r15
hd_loop:
  ; move down until collision
  LDI r0, 0x40D2
  LOAD r14, r0           ; piece_y
  LDI r12, 1
  ADD r14, r12
  LDI r0, 0x40D2
  STORE r0, r14
  CALL check_collision
  JZ r14, hd_done        ; collision detected, piece at final pos
  JMP hd_loop
hd_done:
  ; revert the last move (we moved into collision)
  LDI r0, 0x40D2
  LOAD r14, r0
  LDI r12, 1
  SUB r14, r12
  LDI r0, 0x40D2
  STORE r0, r14
  CALL lock_piece
  CALL clear_lines
  CALL spawn_piece
  POP r31
  JMP draw_and_loop

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: try_move_down -- move piece down, lock if can't
; ─────────────────────────────────────────────────────────────────
try_move_down:
  PUSH r31
  LDI r0, 0x40D2
  LOAD r14, r0           ; piece_y
  LDI r12, 1
  ADD r14, r12
  LDI r0, 0x40D2
  STORE r0, r14
  CALL check_collision
  JNZ r14, tmd_ok        ; no collision, piece moved down
  ; collision: revert and lock
  LDI r0, 0x40D2
  LOAD r14, r0
  LDI r12, 1
  SUB r14, r12
  LDI r0, 0x40D2
  STORE r0, r14
  CALL lock_piece
  CALL clear_lines
  CALL spawn_piece
tmd_ok:
  POP r31
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: check_collision
;   Returns r14 = 0 if collision, 1 if no collision
;   Checks current piece position against board and walls
; ─────────────────────────────────────────────────────────────────
check_collision:
  ; load piece info
  LDI r0, 0x40D0
  LOAD r4, r0          ; current_piece index
  LDI r0, 0x40D1
  LOAD r8, r0          ; piece_x
  LDI r0, 0x40D2
  LOAD r9, r0          ; piece_y
  LDI r0, 0x40D3
  LOAD r5, r0          ; piece_rot

  ; compute piece data address: 0x4100 + piece * 64 + rot * 16
  LDI r14, 0
  ADD r14, r4
  LDI r12, 64
  MUL r14, r12
  LDI r12, 0x4100
  ADD r14, r12
  LDI r12, 0
  ADD r12, r5
  LDI r15, 16
  MUL r12, r15
  ADD r14, r12            ; r14 = base address of rotation data

  LDI r1, 0            ; row counter (0-3)
cc_row:
  ; load row bitmap
  LDI r0, 0
  ADD r0, r14
  ADD r0, r1
  LOAD r13, r0          ; r13 = row bitmap

  LDI r16, 0            ; col counter (0-3)
cc_col:
  ; check bit 3-col (MSB = leftmost in 4-bit field)
  ; we want bit at position (3 - col)
  LDI r0, 3
  LDI r12, 0
  ADD r12, r16
  SUB r0, r12            ; r0 = 3 - col
  ; shift right by r0, AND with 1
  LDI r12, 0
  ADD r12, r13
  LDI r15, 0
  ADD r15, r0
  SHR r12, r15            ; r12 = bitmap >> (3-col)
  LDI r15, 1
  AND r12, r15            ; r12 = bit

  JZ r12, cc_next        ; empty cell, skip

  ; check bounds
  ; board col = piece_x + col, must be 0..9
  LDI r0, 0
  ADD r0, r8
  ADD r0, r16           ; board col
  LDI r15, 0
  CMP r0, r15
  BLT r6, cc_collision
  LDI r15, 10
  CMP r0, r15
  BGE r6, cc_collision

  ; board row = piece_y + row, must be 0..19
  LDI r0, 0
  ADD r0, r9
  ADD r0, r1           ; board row
  LDI r15, 20
  CMP r0, r15
  BGE r6, cc_collision
  ; row < 0 (unsigned underflow) -- let it go (piece above board is ok)

  ; check board cell (only if row < 20)
  LDI r0, 0
  ADD r0, r9
  ADD r0, r1
  LDI r15, 20
  CMP r0, r15
  BGE r6, cc_next       ; above board, ok
  ; board[row * 10 + col]
  LDI r12, 0
  ADD r12, r9
  ADD r12, r1
  LDI r15, 10
  MUL r12, r15
  LDI r15, 0
  ADD r15, r8
  ADD r15, r16
  ADD r12, r15            ; board index
  LDI r0, 0x4000
  ADD r0, r12
  LOAD r12, r0           ; board cell
  JNZ r12, cc_collision  ; occupied = collision

cc_next:
  LDI r12, 1
  ADD r16, r12
  LDI r15, 4
  CMP r16, r15
  BLT r6, cc_col

  LDI r12, 1
  ADD r1, r12
  LDI r15, 4
  CMP r1, r15
  BLT r6, cc_row

  ; no collision
  LDI r14, 1
  RET

cc_collision:
  LDI r14, 0
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: lock_piece -- write piece into board
; ─────────────────────────────────────────────────────────────────
lock_piece:
  LDI r0, 0x40D0
  LOAD r4, r0          ; piece index
  LDI r0, 0x40D1
  LOAD r8, r0          ; piece_x
  LDI r0, 0x40D2
  LOAD r9, r0          ; piece_y
  LDI r0, 0x40D3
  LOAD r5, r0          ; piece_rot

  ; get piece color
  LDI r0, 0x42C0
  ADD r0, r4
  LOAD r20, r0          ; r20 = color

  ; compute piece data address
  LDI r14, 0
  ADD r14, r4
  LDI r12, 64
  MUL r14, r12
  LDI r12, 0x4100
  ADD r14, r12
  LDI r12, 0
  ADD r12, r5
  LDI r15, 16
  MUL r12, r15
  ADD r14, r12

  LDI r1, 0
lp_row:
  LDI r0, 0
  ADD r0, r14
  ADD r0, r1
  LOAD r13, r0

  LDI r16, 0
lp_col:
  ; extract bit
  LDI r0, 3
  LDI r12, 0
  ADD r12, r16
  SUB r0, r12
  LDI r12, 0
  ADD r12, r13
  LDI r15, 0
  ADD r15, r0
  SHR r12, r15
  LDI r15, 1
  AND r12, r15

  JZ r12, lp_next

  ; bounds check
  LDI r0, 0
  ADD r0, r9
  ADD r0, r1           ; row
  LDI r15, 20
  CMP r0, r15
  BGE r6, lp_next

  ; write color to board
  LDI r12, 0
  ADD r12, r9
  ADD r12, r1
  LDI r15, 10
  MUL r12, r15
  LDI r15, 0
  ADD r15, r8
  ADD r15, r16
  ADD r12, r15
  LDI r0, 0x4000
  ADD r0, r12
  STORE r0, r20

lp_next:
  LDI r12, 1
  ADD r16, r12
  LDI r15, 4
  CMP r16, r15
  BLT r6, lp_col

  LDI r12, 1
  ADD r1, r12
  LDI r15, 4
  CMP r1, r15
  BLT r6, lp_row

  ; lock sound
  LDI r12, 330
  LDI r15, 30
  BEEP r12, r15

  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: clear_lines -- scan for full rows and clear them
;   Updates score and lines_cleared
; ─────────────────────────────────────────────────────────────────
clear_lines:
  PUSH r31
  LDI r25, 0            ; lines cleared this turn

  ; scan from bottom row (row 19) to top (row 0)
  LDI r1, 19
cl_row:
  ; check if row is full
  LDI r16, 0
  LDI r13, 1             ; assume full

  ; check 10 cells
  LDI r4, 0
cl_check:
  LDI r12, 0
  ADD r12, r1
  LDI r15, 10
  MUL r12, r15
  ADD r12, r4
  LDI r0, 0x4000
  ADD r0, r12
  LOAD r14, r0
  JZ r14, cl_not_full     ; empty cell = not full
  LDI r12, 1
  ADD r4, r12
  LDI r15, 10
  CMP r4, r15
  BLT r6, cl_check
  ; all 10 cells occupied = full row
  JMP cl_do_clear

cl_not_full:
  LDI r12, 1
  SUB r1, r12
  LDI r15, 0
  ; use BLT with signed comparison: if row < 0, unsigned wraps, but
  ; we compare with 0 as unsigned. If r1 was 0 and we subtract 1,
  ; it becomes 0xFFFFFFFF which is >= 0. So we need a different approach.
  ; Use CMP: if r1 < 0 (as signed), CMP with 0 would show BLT.
  ; But we use unsigned CMP. Let's just check if r1 > 19 or == 0xFFFFFFFF.
  ; Actually: CMP r1, r15 where r15=0 and using BLT: unsigned 0xFFFFFFFF > 0,
  ; so BLT won't trigger. We need a different sentinel.
  ; Fix: check if r1 < 0 by checking if r1 >= 0x80000000 (sign bit set)
  LDI r15, 0x80000000
  CMP r1, r15
  BGE r6, cl_done        ; sign bit set = underflow = done
  JMP cl_row

cl_do_clear:
  ; shift all rows above this one down by 1
  ; row r1 is full: copy row r1-1 to r1, r1-2 to r1-1, etc.
  LDI r13, 0             ; src row = r1 - 1
  LDI r12, 1
  SUB r13, r1
  LDI r12, 1
  ; wait, r13 = r1, then subtract 1
  LDI r13, 0
  ADD r13, r1

cl_shift:
  ; src_row = r13 - 1
  LDI r12, 0
  ADD r12, r13
  LDI r15, 1
  SUB r12, r15            ; r12 = src_row = r13 - 1
  ; if src_row < 0 (sign bit), we're at top, clear row 0 and stop
  LDI r15, 0x80000000
  CMP r12, r15
  BGE r6, cl_clear_top

  ; copy src_row to r13
  LDI r4, 0
cl_copy:
  ; src: board[src_row * 10 + col]
  LDI r0, 0
  ADD r0, r12
  LDI r15, 10
  MUL r0, r15
  ADD r0, r4
  LDI r10, 0x4000
  ADD r10, r0
  LOAD r14, r10           ; src cell

  ; dst: board[r13 * 10 + col]
  LDI r0, 0
  ADD r0, r13
  LDI r15, 10
  MUL r0, r15
  ADD r0, r4
  LDI r10, 0x4000
  ADD r10, r0
  STORE r10, r14          ; dst cell

  LDI r15, 1
  ADD r4, r15
  LDI r10, 10
  CMP r4, r10
  BLT r6, cl_copy

  LDI r15, 1
  SUB r13, r15
  ; check if r13 went below 0
  LDI r15, 0x80000000
  CMP r13, r15
  BGE r6, cl_clear_top
  JMP cl_shift

cl_clear_top:
  ; clear row 0
  LDI r4, 0
cl_clr:
  LDI r0, 0x4000
  ADD r0, r4
  LDI r14, 0
  STORE r0, r14
  LDI r12, 1
  ADD r4, r12
  LDI r15, 10
  CMP r4, r15
  BLT r6, cl_clr

  ; increment lines cleared this turn
  LDI r12, 1
  ADD r25, r12

  ; continue scanning from same row (shifted rows might also be full)
  JMP cl_row

cl_done:
  ; r25 = lines cleared this turn
  JZ r25, cl_ret
  
  ; Update score based on r25
  LDI r0, 0x40D4
  LOAD r14, r0           ; r14 = current score
  
  LDI r15, 1
  CMP r25, r15
  JZ r6, score_1
  
  LDI r15, 2
  CMP r25, r15
  JZ r6, score_2
  
  LDI r15, 3
  CMP r25, r15
  JZ r6, score_3
  
  ; 4 lines (Tetris)
  LDI r12, 800
  ADD r14, r12
  JMP score_stored

score_1:
  LDI r12, 100
  ADD r14, r12
  JMP score_stored
score_2:
  LDI r12, 300
  ADD r14, r12
  JMP score_stored
score_3:
  LDI r12, 500
  ADD r14, r12

score_stored:
  LDI r0, 0x40D4
  STORE r0, r14
  
  ; Clear sound
  LDI r12, 880
  LDI r15, 100
  BEEP r12, r15

  ; Update total lines_cleared
  LDI r0, 0x40D5
  LOAD r14, r0
  ADD r14, r25
  LDI r0, 0x40D5
  STORE r0, r14
  
  ; Update level = total_lines / 10
  LDI r7, 0
  ADD r7, r14
  LDI r2, 10
  DIV r7, r2
  LDI r0, 0x40DA
  STORE r0, r7

cl_ret:
  POP r31
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: spawn_piece -- next piece becomes current, pick new next
; ─────────────────────────────────────────────────────────────────
spawn_piece:
  PUSH r31
  ; copy next_piece to current_piece
  LDI r0, 0x40D7
  LOAD r14, r0
  LDI r0, 0x40D0
  STORE r0, r14           ; current_piece = next_piece

  ; pick new next_piece
  RAND r14
  LDI r7, 7
  MOD r14, r7
  LDI r0, 0x40D7
  STORE r0, r14

  ; reset piece state
  LDI r14, 3             ; start at column 3 (centered)
  LDI r0, 0x40D1
  STORE r0, r14           ; piece_x = 3
  LDI r14, 0
  LDI r0, 0x40D2
  STORE r0, r14           ; piece_y = 0 (top)
  LDI r14, 0
  LDI r0, 0x40D3
  STORE r0, r14           ; piece_rot = 0
  LDI r14, 0
  LDI r0, 0x40D9
  STORE r0, r14           ; drop_counter = 0

  ; check if new piece collides immediately = game over
  CALL check_collision
  JNZ r14, sp_ok
  ; collision at spawn = game over
  LDI r14, 1
  LDI r0, 0x40D6
  STORE r0, r14
  ; game over sound
  LDI r12, 110
  LDI r15, 300
  BEEP r12, r15
sp_ok:
  POP r31
  RET

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r14, 0x220000
  FILL r14
  FRAME
  IKEY r10
  JZ r10, game_over_screen
  JMP restart

; ── draw ─────────────────────────────────────────────────────────
draw_and_loop:
  CALL draw_frame
  FRAME
  JMP game_loop

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_frame -- render board, piece, UI
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; dark background
  LDI r14, 0x000811
  FILL r14

  ; draw board cells
  LDI r1, 0            ; row
df_brow:
  LDI r16, 0            ; col
df_bcol:
  ; board[row * 10 + col]
  LDI r12, 0
  ADD r12, r1
  LDI r15, 10
  MUL r12, r15
  ADD r12, r16
  LDI r0, 0x4000
  ADD r0, r12
  LOAD r20, r0          ; cell color (0=empty)

  JZ r20, df_bskip

  ; pixel x = 10 + col * 12
  LDI r12, 0
  ADD r12, r16
  LDI r15, 12
  MUL r12, r15
  LDI r15, 10
  ADD r12, r15            ; px_x

  ; pixel y = 8 + row * 12
  LDI r15, 0
  ADD r15, r1
  LDI r10, 12
  MUL r15, r10
  LDI r10, 8
  ADD r15, r10            ; px_y

  LDI r21, 11           ; width (12-1 for 1px gap)
  LDI r22, 11           ; height
  RECTF r12, r15, r21, r22, r20

df_bskip:
  LDI r12, 1
  ADD r16, r12
  LDI r15, 10
  CMP r16, r15
  BLT r6, df_bcol

  LDI r12, 1
  ADD r1, r12
  LDI r15, 20
  CMP r1, r15
  BLT r6, df_brow

  ; draw current piece
  PUSH r31
  CALL draw_piece
  POP r31

  ; draw board border
  ; left edge: x=9, y=8, w=1, h=240
  LDI r12, 9
  LDI r15, 8
  LDI r10, 1
  LDI r11, 240
  LDI r3, 0x555555
  RECTF r12, r15, r10, r11, r3
  ; right edge: x=130, y=8, w=1, h=240
  LDI r12, 130
  RECTF r12, r15, r10, r11, r3
  ; bottom edge: x=9, y=248, w=122, h=1
  LDI r12, 9
  LDI r15, 248
  LDI r10, 122
  LDI r11, 1
  RECTF r12, r15, r10, r11, r3

  ; draw score
  PUSH r31
  CALL draw_score
  POP r31

  ; draw lines
  PUSH r31
  CALL draw_lines
  POP r31

  ; draw level
  PUSH r31
  CALL draw_level
  POP r31

  ; draw next piece preview
  PUSH r31
  CALL draw_next
  POP r31

  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_piece -- draw current falling piece
; ─────────────────────────────────────────────────────────────────
draw_piece:
  LDI r0, 0x40D6
  LOAD r14, r0
  JNZ r14, dp_ret         ; game over, don't draw piece

  LDI r0, 0x40D0
  LOAD r4, r0
  LDI r0, 0x40D1
  LOAD r8, r0
  LDI r0, 0x40D2
  LOAD r9, r0
  LDI r0, 0x40D3
  LOAD r5, r0

  ; get color
  LDI r0, 0x42C0
  ADD r0, r4
  LOAD r20, r0

  ; compute data address
  LDI r14, 0
  ADD r14, r4
  LDI r12, 64
  MUL r14, r12
  LDI r12, 0x4100
  ADD r14, r12
  LDI r12, 0
  ADD r12, r5
  LDI r15, 16
  MUL r12, r15
  ADD r14, r12

  LDI r1, 0
dp_row:
  LDI r0, 0
  ADD r0, r14
  ADD r0, r1
  LOAD r13, r0

  LDI r16, 0
dp_col:
  ; extract bit
  LDI r0, 3
  LDI r12, 0
  ADD r12, r16
  SUB r0, r12
  LDI r12, 0
  ADD r12, r13
  LDI r15, 0
  ADD r15, r0
  SHR r12, r15
  LDI r15, 1
  AND r12, r15

  JZ r12, dp_next

  ; only draw if on screen (row >= 0)
  LDI r0, 0
  ADD r0, r9
  ADD r0, r1           ; board row
  LDI r15, 20
  CMP r0, r15
  BGE r6, dp_next

  ; pixel coords
  LDI r12, 0
  ADD r12, r8
  ADD r12, r16
  LDI r15, 12
  MUL r12, r15
  LDI r15, 10
  ADD r12, r15            ; px_x

  LDI r15, 0
  ADD r15, r9
  ADD r15, r1
  LDI r10, 12
  MUL r15, r10
  LDI r10, 8
  ADD r15, r10            ; px_y

  LDI r21, 11
  LDI r22, 11
  RECTF r12, r15, r21, r22, r20

dp_next:
  LDI r12, 1
  ADD r16, r12
  LDI r15, 4
  CMP r16, r15
  BLT r6, dp_col

  LDI r12, 1
  ADD r1, r12
  LDI r15, 4
  CMP r1, r15
  BLT r6, dp_row

dp_ret:
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_score -- display score on right panel
; ─────────────────────────────────────────────────────────────────
draw_score:
  ; score text "SCORE:" at 0x4200..0x4205
  LDI r0, 0x4300
  LDI r14, 83
  STORE r0, r14
  LDI r0, 0x4301
  LDI r14, 67
  STORE r0, r14
  LDI r0, 0x4302
  LDI r14, 79
  STORE r0, r14
  LDI r0, 0x4303
  LDI r14, 82
  STORE r0, r14
  LDI r0, 0x4304
  LDI r14, 69
  STORE r0, r14
  LDI r0, 0x4305
  LDI r14, 58
  STORE r0, r14

  ; convert score to 5 digits
  LDI r0, 0x40D4
  LOAD r14, r0           ; score

  ; ten-thousands
  LDI r7, 0
  ADD r7, r14
  LDI r2, 10000
  DIV r7, r2
  LDI r12, 48
  ADD r7, r12
  LDI r0, 0x4306
  STORE r0, r7

  ; thousands
  LDI r7, 0
  ADD r7, r14
  LDI r2, 10000
  LDI r15, 0
  ADD r15, r0
  LOAD r15, r15
  LDI r12, 48
  SUB r15, r12
  MUL r15, r2
  SUB r7, r15
  LDI r2, 1000
  DIV r7, r2
  LDI r12, 48
  ADD r7, r12
  LDI r0, 0x4307
  STORE r0, r7

  ; hundreds
  LDI r7, 0
  ADD r7, r14
  LDI r2, 10000
  LDI r15, 0
  ADD r15, r0
  LOAD r15, r15
  LDI r12, 48
  SUB r15, r12
  MUL r15, r2
  LDI r0, 0x4307
  LOAD r10, r0
  LDI r12, 48
  SUB r10, r12
  LDI r2, 1000
  MUL r10, r2
  ADD r15, r10
  SUB r7, r15
  LDI r2, 100
  DIV r7, r2
  LDI r12, 48
  ADD r7, r12
  LDI r0, 0x4308
  STORE r0, r7

  ; tens
  LDI r7, 0
  ADD r7, r14
  ; subtract (10000*tth + 1000*th + 100*h)
  ; simpler: score mod 100 / 10
  LDI r2, 100
  MOD r7, r2
  LDI r2, 10
  DIV r7, r2
  LDI r12, 48
  ADD r7, r12
  LDI r0, 0x4309
  STORE r0, r7

  ; ones
  LDI r7, 0
  ADD r7, r14
  LDI r2, 10
  MOD r7, r2
  LDI r12, 48
  ADD r7, r12
  LDI r0, 0x430A
  STORE r0, r7

  ; null terminator
  LDI r14, 0
  LDI r0, 0x430B
  STORE r0, r14

  ; render
  LDI r12, 138
  LDI r15, 10
  LDI r10, 0x4300
  TEXT r12, r15, r10

  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_lines -- display lines cleared count
; ─────────────────────────────────────────────────────────────────
draw_lines:
  ; "LINES:" at 0x4210..0x4215
  LDI r0, 0x4310
  LDI r14, 76
  STORE r0, r14
  LDI r0, 0x4311
  LDI r14, 73
  STORE r0, r14
  LDI r0, 0x4312
  LDI r14, 78
  STORE r0, r14
  LDI r0, 0x4313
  LDI r14, 69
  STORE r0, r14
  LDI r0, 0x4314
  LDI r14, 83
  STORE r0, r14
  LDI r0, 0x4315
  LDI r14, 58
  STORE r0, r14

  ; lines count (max 999)
  LDI r0, 0x40D5
  LOAD r14, r0

  ; hundreds
  LDI r7, 0
  ADD r7, r14
  LDI r2, 100
  DIV r7, r2
  LDI r12, 48
  ADD r7, r12
  LDI r0, 0x4316
  STORE r0, r7

  ; tens
  LDI r7, 0
  ADD r7, r14
  LDI r2, 100
  MOD r7, r2
  LDI r2, 10
  DIV r7, r2
  LDI r12, 48
  ADD r7, r12
  LDI r0, 0x4317
  STORE r0, r7

  ; ones
  LDI r7, 0
  ADD r7, r14
  LDI r2, 10
  MOD r7, r2
  LDI r12, 48
  ADD r7, r12
  LDI r0, 0x4318
  STORE r0, r7

  ; null terminator
  LDI r14, 0
  LDI r0, 0x4319
  STORE r0, r14

  LDI r12, 138
  LDI r15, 26
  LDI r10, 0x4310
  TEXT r12, r15, r10

  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_next -- preview next piece
; ─────────────────────────────────────────────────────────────────
draw_next:
  ; "NEXT:" label
  LDI r0, 0x4320
  LDI r14, 78
  STORE r0, r14
  LDI r0, 0x4321
  LDI r14, 69
  STORE r0, r14
  LDI r0, 0x4322
  LDI r14, 88
  STORE r0, r14
  LDI r0, 0x4323
  LDI r14, 84
  STORE r0, r14
  LDI r0, 0x4324
  LDI r14, 58
  STORE r0, r14

  LDI r12, 138
  LDI r15, 50
  LDI r10, 0x4320
  TEXT r12, r15, r10

  ; draw the next piece in preview area
  LDI r0, 0x40D7
  LOAD r4, r0          ; next piece index

  ; get color
  LDI r0, 0x42C0
  ADD r0, r4
  LOAD r20, r0

  ; draw rotation 0
  LDI r14, 0
  ADD r14, r4
  LDI r12, 64
  MUL r14, r12
  LDI r12, 0x4100
  ADD r14, r12            ; r14 = base address

  LDI r1, 0
dn_row:
  LDI r0, 0
  ADD r0, r14
  ADD r0, r1
  LOAD r13, r0

  LDI r16, 0
dn_col:
  LDI r0, 3
  LDI r12, 0
  ADD r12, r16
  SUB r0, r12
  LDI r12, 0
  ADD r12, r13
  LDI r15, 0
  ADD r15, r0
  SHR r12, r15
  LDI r15, 1
  AND r12, r15

  JZ r12, dn_next

  ; preview at x=148, y=66, 8px per cell
  LDI r12, 0
  ADD r12, r16
  LDI r15, 8
  MUL r12, r15
  LDI r15, 148
  ADD r12, r15

  LDI r15, 0
  ADD r15, r1
  LDI r10, 8
  MUL r15, r10
  LDI r10, 66
  ADD r15, r10

  LDI r21, 7
  LDI r22, 7
  RECTF r12, r15, r21, r22, r20

dn_next:
  LDI r12, 1
  ADD r16, r12
  LDI r15, 4
  CMP r16, r15
  BLT r6, dn_col

  LDI r12, 1
  ADD r1, r12
  LDI r15, 4
  CMP r1, r15
  BLT r6, dn_row

  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_level -- display level
; ─────────────────────────────────────────────────────────────────
draw_level:
  ; "LEVEL:" at 0x4330..0x4335
  LDI r0, 0x4330
  LDI r14, 76
  STORE r0, r14 ; L
  LDI r0, 0x4331
  LDI r14, 69
  STORE r0, r14 ; E
  LDI r0, 0x4332
  LDI r14, 86
  STORE r0, r14 ; V
  LDI r0, 0x4333
  LDI r14, 69
  STORE r0, r14 ; E
  LDI r0, 0x4334
  LDI r14, 76
  STORE r0, r14 ; L
  LDI r0, 0x4335
  LDI r14, 58
  STORE r0, r14 ; :
  
  LDI r0, 0x40DA
  LOAD r14, r0 ; level
  
  ; tens
  LDI r7, 0
  ADD r7, r14
  LDI r2, 10
  DIV r7, r2
  LDI r12, 48
  ADD r7, r12
  LDI r0, 0x4336
  STORE r0, r7
  
  ; ones
  LDI r7, 0
  ADD r7, r14
  LDI r2, 10
  MOD r7, r2
  LDI r12, 48
  ADD r7, r12
  LDI r0, 0x4337
  STORE r0, r7
  
  ; null
  LDI r14, 0
  LDI r0, 0x4338
  STORE r0, r14
  
  ; render
  LDI r12, 138
  LDI r15, 50
  LDI r10, 0x4330
  TEXT r12, r15, r10
  RET
