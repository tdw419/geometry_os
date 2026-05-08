; DESCRIPTION: Display a line using color red at the screen.

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

; -- Constants ------------------------------------------------------
; COLS=10, ROWS=20, CELL=12
; BOARD_BASE=0x4000, PIECE_DATA=0x4100
; Play area pixel origin: (10, 8)

; -- Piece data initialization --------------------------------------
; We write piece data at runtime since we can't do complex immediate writes


restart:
  LDI r30, 0x8000       ; stack pointer

  CALL init_pieces
  CALL init_colors

  ; clear board
  LDI r5, 0
  LDI r10, 160          ; 10 * 20 = 200 cells... wait, 10*20=200
  ; actually 10 cols * 20 rows = 200
clear_board:
  LDI r7, 0x4000
  ADD r7, r5
  LDI r11, 0
  STORE r7, r11
  LDI r12, 1
  ADD r5, r12
  LDI r8, 200
  CMP r5, r8
  BLT r9, clear_board

  ; reset game state
  LDI r11, 0
  LDI r7, 0x40D4
  STORE r7, r11           ; score = 0
  LDI r11, 0
  LDI r7, 0x40D5
  STORE r7, r11           ; lines_cleared = 0
  LDI r11, 0
  LDI r7, 0x40D6
  STORE r7, r11           ; game_over = 0
  LDI r11, 0
  LDI r7, 0x40D8
  STORE r7, r11           ; soft_drop = 0
  LDI r11, 0
  LDI r7, 0x40D9
  STORE r7, r11           ; drop_counter = 0
  LDI r11, 0
  LDI r7, 0x40DA
  STORE r7, r11           ; level = 0

  ; pick first and next piece
  RAND r11
  LDI r1, 7
  MOD r11, r1
  LDI r7, 0x40D7
  STORE r7, r11           ; next_piece
  CALL spawn_piece

; -- main loop ------------------------------------------------------

init_pieces:
  ; Piece 0 (I)
  ; rot0: rows 0,1,2,3 = 0,0,15,0 (XXXX in row 2)
  LDI r7, 0x4100
  LDI r11, 0
  STORE r7, r11
  LDI r7, 0x4101
  LDI r11, 0
  STORE r7, r11
  LDI r7, 0x4102
  LDI r11, 15
  STORE r7, r11
  LDI r7, 0x4103
  LDI r11, 0
  STORE r7, r11
  ; rot1: rows = 4,4,4,4 (.X.. each row = 0100 = 4)
  LDI r7, 0x4104
  LDI r11, 4
  STORE r7, r11
  LDI r7, 0x4105
  LDI r11, 4
  STORE r7, r11
  LDI r7, 0x4106
  LDI r11, 4
  STORE r7, r11
  LDI r7, 0x4107
  LDI r11, 4
  STORE r7, r11
  ; rot2: rows = 0,0,15,0
  LDI r7, 0x4108
  LDI r11, 0
  STORE r7, r11
  LDI r7, 0x4109
  LDI r11, 0
  STORE r7, r11
  LDI r7, 0x410A
  LDI r11, 15
  STORE r7, r11
  LDI r7, 0x410B
  LDI r11, 0
  STORE r7, r11
  ; rot3: rows = 2,2,2,2 (..X. = 0010 = 2)
  LDI r7, 0x410C
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x410D
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x410E
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x410F
  LDI r11, 2
  STORE r7, r11

  ; Piece 1 (O)
  ; all rotations: 6,6,0,0 (.XX. = 0110 = 6)
  LDI r5, 0x4140
ip_o_loop:
  LDI r11, 6
  STORE r5, r11
  LDI r12, 1
  ADD r5, r12
  LDI r11, 6
  STORE r5, r11
  LDI r12, 1
  ADD r5, r12
  LDI r11, 0
  STORE r5, r11
  LDI r12, 1
  ADD r5, r12
  LDI r11, 0
  STORE r5, r11
  LDI r12, 1
  ADD r5, r12
  LDI r8, 0x4160
  CMP r5, r8
  BLT r9, ip_o_loop

  ; Piece 2 (T)
  ; rot0: 2,7,0,0 (.X. XXX .... ....)
  LDI r7, 0x4180
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x4181
  LDI r11, 7
  STORE r7, r11
  LDI r7, 0x4282
  LDI r11, 0
  STORE r7, r11
  LDI r7, 0x4283
  LDI r11, 0
  STORE r7, r11
  ; rot1: 2,3,2,0 (.X. .XX .X. ....)
  LDI r7, 0x4284
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x4285
  LDI r11, 3
  STORE r7, r11
  LDI r7, 0x4286
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x4287
  LDI r11, 0
  STORE r7, r11
  ; rot2: 0,7,2,0 (.... XXX .X. ....)
  LDI r7, 0x4288
  LDI r11, 0
  STORE r7, r11
  LDI r7, 0x4289
  LDI r11, 7
  STORE r7, r11
  LDI r7, 0x428A
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x428B
  LDI r11, 0
  STORE r7, r11
  ; rot3: 2,6,2,0 (X.. .XX .X. ....)
  LDI r7, 0x428C
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x428D
  LDI r11, 6
  STORE r7, r11
  LDI r7, 0x428E
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x428F
  LDI r11, 0
  STORE r7, r11

  ; Piece 3 (S)
  ; rot0: 3,3,0,0  (..XX .XX. .... ....) -- wait let me recalculate
  ; .XX. = 0110 = 6, XX.. = 1100 = 12
  ; rot0: 6,3,0,0
  LDI r7, 0x41C0
  LDI r11, 6
  STORE r7, r11
  LDI r7, 0x41C1
  LDI r11, 3
  STORE r7, r11
  LDI r7, 0x41C2
  LDI r11, 0
  STORE r7, r11
  LDI r7, 0x41C3
  LDI r11, 0
  STORE r7, r11
  ; rot1: 2,3,1,0  (.X. .XX ..X. ....)
  LDI r7, 0x41C4
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x41C5
  LDI r11, 3
  STORE r7, r11
  LDI r7, 0x41C6
  LDI r11, 1
  STORE r7, r11
  LDI r7, 0x41C7
  LDI r11, 0
  STORE r7, r11
  ; rot2: 0,6,3,0  (.... .XX. ..XX ....)
  LDI r7, 0x41C8
  LDI r11, 0
  STORE r7, r11
  LDI r7, 0x41C9
  LDI r11, 6
  STORE r7, r11
  LDI r7, 0x41CA
  LDI r11, 3
  STORE r7, r11
  LDI r7, 0x41CB
  LDI r11, 0
  STORE r7, r11
  ; rot3: 2,6,4,0  (X.. .XX XX.. ....)
  LDI r7, 0x41CC
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x41CD
  LDI r11, 6
  STORE r7, r11
  LDI r7, 0x41CE
  LDI r11, 4
  STORE r7, r11
  LDI r7, 0x41CF
  LDI r11, 0
  STORE r7, r11

  ; Piece 4 (Z)
  ; rot0: 3,6,0,0  (..XX .XX. .... ....)
  LDI r7, 0x4300
  LDI r11, 3
  STORE r7, r11
  LDI r7, 0x4301
  LDI r11, 6
  STORE r7, r11
  LDI r7, 0x4302
  LDI r11, 0
  STORE r7, r11
  LDI r7, 0x4303
  LDI r11, 0
  STORE r7, r11
  ; rot1: 1,3,2,0  (..X. .XX. .X.. ....)
  LDI r7, 0x4304
  LDI r11, 1
  STORE r7, r11
  LDI r7, 0x4305
  LDI r11, 3
  STORE r7, r11
  LDI r7, 0x4306
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x4307
  LDI r11, 0
  STORE r7, r11
  ; rot2: 0,3,6,0  (.... ..XX .XX. ....)
  LDI r7, 0x4308
  LDI r11, 0
  STORE r7, r11
  LDI r7, 0x4309
  LDI r11, 3
  STORE r7, r11
  LDI r7, 0x430A
  LDI r11, 6
  STORE r7, r11
  LDI r7, 0x430B
  LDI r11, 0
  STORE r7, r11
  ; rot3: 4,6,2,0  (XX.. .XX. .X.. ....)
  LDI r7, 0x420C
  LDI r11, 4
  STORE r7, r11
  LDI r7, 0x420D
  LDI r11, 6
  STORE r7, r11
  LDI r7, 0x420E
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x420F
  LDI r11, 0
  STORE r7, r11

  ; Piece 5 (L)
  ; rot0: 1,1,3,0  (X.. X.. .XX. ....)
  LDI r7, 0x4240
  LDI r11, 1
  STORE r7, r11
  LDI r7, 0x4241
  LDI r11, 1
  STORE r7, r11
  LDI r7, 0x4242
  LDI r11, 3
  STORE r7, r11
  LDI r7, 0x4243
  LDI r11, 0
  STORE r7, r11
  ; rot1: 2,2,6,0  (.X. .X. .XX. ....)
  LDI r7, 0x4244
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x4245
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x4246
  LDI r11, 6
  STORE r7, r11
  LDI r7, 0x4247
  LDI r11, 0
  STORE r7, r11
  ; rot2: 0,7,4,0  (.... XXX. XX.. ....)
  LDI r7, 0x4248
  LDI r11, 0
  STORE r7, r11
  LDI r7, 0x4249
  LDI r11, 7
  STORE r7, r11
  LDI r7, 0x424A
  LDI r11, 4
  STORE r7, r11
  LDI r7, 0x424B
  LDI r11, 0
  STORE r7, r11
  ; rot3: 2,6,2,0  (.X. .XX. .X. ....)
  LDI r7, 0x424C
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x424D
  LDI r11, 6
  STORE r7, r11
  LDI r7, 0x424E
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x424F
  LDI r11, 0
  STORE r7, r11

  ; Piece 6 (J)
  ; rot0: 4,4,6,0  (XX.. XX.. .XX. ....)
  LDI r7, 0x4280
  LDI r11, 4
  STORE r7, r11
  LDI r7, 0x4281
  LDI r11, 4
  STORE r7, r11
  LDI r7, 0x4182
  LDI r11, 6
  STORE r7, r11
  LDI r7, 0x4183
  LDI r11, 0
  STORE r7, r11
  ; rot1: 6,2,2,0  (.XX. .X.. .X.. ....)
  LDI r7, 0x4184
  LDI r11, 6
  STORE r7, r11
  LDI r7, 0x4185
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x4186
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x4187
  LDI r11, 0
  STORE r7, r11
  ; rot2: 0,7,1,0  (.... .XXX ..X. ....)
  LDI r7, 0x4188
  LDI r11, 0
  STORE r7, r11
  LDI r7, 0x4189
  LDI r11, 7
  STORE r7, r11
  LDI r7, 0x418A
  LDI r11, 1
  STORE r7, r11
  LDI r7, 0x418B
  LDI r11, 0
  STORE r7, r11
  ; rot3: 2,6,4,0  (.X. .XX. XX.. ....)
  LDI r7, 0x418C
  LDI r11, 2
  STORE r7, r11
  LDI r7, 0x418D
  LDI r11, 6
  STORE r7, r11
  LDI r7, 0x418E
  LDI r11, 4
  STORE r7, r11
  LDI r7, 0x418F
  LDI r11, 0
  STORE r7, r11

  RET

; -- Piece colors (stored at 0x42C0, one per piece) ----------------
; 0=I cyan, 1=O yellow, 2=T purple, 3=S green, 4=Z red, 5=L orange, 6=J blue
init_colors:
  LDI r7, 0x42C0
  LDI r11, 0x00CCCC     ; I - cyan
  STORE r7, r11
  LDI r7, 0x42C1
  LDI r11, 0xCCCC00     ; O - yellow
  STORE r7, r11
  LDI r7, 0x42C2
  LDI r11, 0xAA00CC     ; T - purple
  STORE r7, r11
  LDI r7, 0x42C3
  LDI r11, 0x00CC44     ; S - green
  STORE r7, r11
  LDI r7, 0x42C4
  LDI r11, 0xCC2200     ; Z - red
  STORE r7, r11
  LDI r7, 0x42C5
  LDI r11, 0xFF8800     ; L - orange
  STORE r7, r11
  LDI r7, 0x42C6
  LDI r11, 0x2244CC     ; J - blue
  STORE r7, r11
  RET

; -- init / restart -------------------------------------------------
game_loop:
  ; check game over
  LDI r7, 0x40D6
  LOAD r11, r7
  JNZ r11, game_over_screen

  ; read keyboard
  IKEY r2

  ; A/a = move left
  LDI r8, 65
  CMP r2, r8
  JZ r9, do_left
  LDI r8, 97
  CMP r2, r8
  JZ r9, do_left

  ; D/d = move right
  LDI r8, 68
  CMP r2, r8
  JZ r9, do_right
  LDI r8, 100
  CMP r2, r8
  JZ r9, do_right

  ; W/w = rotate
  LDI r8, 87
  CMP r2, r8
  JZ r9, do_rotate
  LDI r8, 119
  CMP r2, r8
  JZ r9, do_rotate

  ; S/s = soft drop
  LDI r8, 83
  CMP r2, r8
  JZ r9, do_soft_drop
  LDI r8, 115
  CMP r2, r8
  JZ r9, do_soft_drop

  ; Space = hard drop
  LDI r8, 32
  CMP r2, r8
  JZ r9, do_hard_drop

  ; R/r = restart
  LDI r8, 82
  CMP r2, r8
  JZ r9, restart
  LDI r8, 114
  CMP r2, r8
  JZ r9, restart

after_input:
  ; auto-drop: check tick counter
  ; Normal speed: drop every 15 frames. Soft drop: every 3 frames.
  LDI r7, 0x40D9
  LOAD r11, r7           ; drop_counter
  LDI r12, 1
  ADD r11, r12
  LDI r7, 0x40D9
  STORE r7, r11

  ; check threshold
  LDI r7, 0x40D8
  LOAD r1, r7           ; soft_drop flag
  JNZ r1, soft_thresh
  
  ; normal threshold based on level: max(2, 15 - level)
  LDI r7, 0x40DA
  LOAD r15, r7           ; r15 = level
  LDI r8, 15
  SUB r8, r15            ; r8 = 15 - level
  
  ; clamp at 2
  LDI r2, 2
  CMP r8, r2
  BGE r9, speed_ok
  LDI r8, 2
speed_ok:
  LDI r7, 0x40D9
  LOAD r11, r7
  CMP r11, r8
  BLT r9, no_drop
  JMP do_drop
soft_thresh:
  LDI r7, 0x40D9
  LOAD r11, r7
  LDI r8, 3
  CMP r11, r8
  BLT r9, no_drop
do_drop:
  LDI r11, 0
  LDI r7, 0x40D9
  STORE r7, r11           ; reset counter
  CALL try_move_down
  JMP draw_and_loop
no_drop:
  JMP draw_and_loop

; -- input handlers -------------------------------------------------
do_left:
  PUSH r31
  LDI r7, 0x40D1
  LOAD r11, r7           ; piece_x
  LDI r12, 1
  SUB r11, r12
  ; try at new position
  LDI r7, 0x40D1
  STORE r7, r11
  CALL check_collision
  JNZ r11, left_ok       ; no collision, keep move
  ; collision: revert
  LDI r7, 0x40D1
  LOAD r11, r7
  LDI r12, 1
  ADD r11, r12
  LDI r7, 0x40D1
  STORE r7, r11
left_ok:
  ; move sound
  LDI r12, 440
  LDI r8, 20
  BEEP r12, r8
  POP r31
  JMP after_input

do_right:
  PUSH r31
  LDI r7, 0x40D1
  LOAD r11, r7
  LDI r12, 1
  ADD r11, r12
  LDI r7, 0x40D1
  STORE r7, r11
  CALL check_collision
  JNZ r11, right_ok
  ; revert
  LDI r7, 0x40D1
  LOAD r11, r7
  LDI r12, 1
  SUB r11, r12
  LDI r7, 0x40D1
  STORE r7, r11
right_ok:
  ; move sound
  LDI r12, 440
  LDI r8, 20
  BEEP r12, r8
  POP r31
  JMP after_input

do_rotate:
  PUSH r31
  LDI r7, 0x40D3
  LOAD r11, r7           ; piece_rot
  LDI r12, 1
  ADD r11, r12
  LDI r8, 4
  MOD r11, r8
  LDI r7, 0x40D3
  STORE r7, r11
  CALL check_collision
  JNZ r11, rot_ok
  ; revert rotation
  LDI r7, 0x40D3
  LOAD r11, r7
  LDI r12, 3
  ADD r11, r12
  LDI r8, 4
  MOD r11, r8
  LDI r7, 0x40D3
  STORE r7, r11
rot_ok:
  ; rotate sound
  LDI r12, 660
  LDI r8, 20
  BEEP r12, r8
  POP r31
  JMP after_input

do_soft_drop:
  LDI r11, 1
  LDI r7, 0x40D8
  STORE r7, r11
  JMP after_input

do_hard_drop:
  PUSH r31
  ; hard drop sound (start)
  LDI r12, 440
  LDI r8, 50
  BEEP r12, r8
hd_loop:
  ; move down until collision
  LDI r7, 0x40D2
  LOAD r11, r7           ; piece_y
  LDI r12, 1
  ADD r11, r12
  LDI r7, 0x40D2
  STORE r7, r11
  CALL check_collision
  JZ r11, hd_done        ; collision detected, piece at final pos
  JMP hd_loop
hd_done:
  ; revert the last move (we moved into collision)
  LDI r7, 0x40D2
  LOAD r11, r7
  LDI r12, 1
  SUB r11, r12
  LDI r7, 0x40D2
  STORE r7, r11
  CALL lock_piece
  CALL clear_lines
  CALL spawn_piece
  POP r31
  JMP draw_and_loop

; -----------------------------------------------------------------
; SUBROUTINE: try_move_down -- move piece down, lock if can't
; -----------------------------------------------------------------
try_move_down:
  PUSH r31
  LDI r7, 0x40D2
  LOAD r11, r7           ; piece_y
  LDI r12, 1
  ADD r11, r12
  LDI r7, 0x40D2
  STORE r7, r11
  CALL check_collision
  JNZ r11, tmd_ok        ; no collision, piece moved down
  ; collision: revert and lock
  LDI r7, 0x40D2
  LOAD r11, r7
  LDI r12, 1
  SUB r11, r12
  LDI r7, 0x40D2
  STORE r7, r11
  CALL lock_piece
  CALL clear_lines
  CALL spawn_piece
tmd_ok:
  POP r31
  RET

; -----------------------------------------------------------------
; SUBROUTINE: check_collision
;   Returns r11 = 0 if collision, 1 if no collision
;   Checks current piece position against board and walls
; -----------------------------------------------------------------
check_collision:
  ; load piece info
  LDI r7, 0x40D0
  LOAD r5, r7          ; current_piece index
  LDI r7, 0x40D1
  LOAD r10, r7          ; piece_x
  LDI r7, 0x40D2
  LOAD r4, r7          ; piece_y
  LDI r7, 0x40D3
  LOAD r3, r7          ; piece_rot

  ; compute piece data address: 0x4100 + piece * 64 + rot * 16
  LDI r11, 0
  ADD r11, r5
  LDI r12, 64
  MUL r11, r12
  LDI r12, 0x4100
  ADD r11, r12
  LDI r12, 0
  ADD r12, r3
  LDI r8, 16
  MUL r12, r8
  ADD r11, r12            ; r11 = base address of rotation data

  LDI r13, 0            ; row counter (0-3)
cc_row:
  ; load row bitmap
  LDI r7, 0
  ADD r7, r11
  ADD r7, r13
  LOAD r14, r7          ; r14 = row bitmap

  LDI r16, 0            ; col counter (0-3)
cc_col:
  ; check bit 3-col (MSB = leftmost in 4-bit field)
  ; we want bit at position (3 - col)
  LDI r7, 3
  LDI r12, 0
  ADD r12, r16
  SUB r7, r12            ; r7 = 3 - col
  ; shift right by r7, AND with 1
  LDI r12, 0
  ADD r12, r14
  LDI r8, 0
  ADD r8, r7
  SHR r12, r8            ; r12 = bitmap >> (3-col)
  LDI r8, 1
  AND r12, r8            ; r12 = bit

  JZ r12, cc_next        ; empty cell, skip

  ; check bounds
  ; board col = piece_x + col, must be 0..9
  LDI r7, 0
  ADD r7, r10
  ADD r7, r16           ; board col
  LDI r8, 0
  CMP r7, r8
  BLT r9, cc_collision
  LDI r8, 10
  CMP r7, r8
  BGE r9, cc_collision

  ; board row = piece_y + row, must be 0..19
  LDI r7, 0
  ADD r7, r4
  ADD r7, r13           ; board row
  LDI r8, 20
  CMP r7, r8
  BGE r9, cc_collision
  ; row < 0 (unsigned underflow) -- let it go (piece above board is ok)

  ; check board cell (only if row < 20)
  LDI r7, 0
  ADD r7, r4
  ADD r7, r13
  LDI r8, 20
  CMP r7, r8
  BGE r9, cc_next       ; above board, ok
  ; board[row * 10 + col]
  LDI r12, 0
  ADD r12, r4
  ADD r12, r13
  LDI r8, 10
  MUL r12, r8
  LDI r8, 0
  ADD r8, r10
  ADD r8, r16
  ADD r12, r8            ; board index
  LDI r7, 0x4000
  ADD r7, r12
  LOAD r12, r7           ; board cell
  JNZ r12, cc_collision  ; occupied = collision

cc_next:
  LDI r12, 1
  ADD r16, r12
  LDI r8, 4
  CMP r16, r8
  BLT r9, cc_col

  LDI r12, 1
  ADD r13, r12
  LDI r8, 4
  CMP r13, r8
  BLT r9, cc_row

  ; no collision
  LDI r11, 1
  RET

cc_collision:
  LDI r11, 0
  RET

; -----------------------------------------------------------------
; SUBROUTINE: lock_piece -- write piece into board
; -----------------------------------------------------------------
lock_piece:
  LDI r7, 0x40D0
  LOAD r5, r7          ; piece index
  LDI r7, 0x40D1
  LOAD r10, r7          ; piece_x
  LDI r7, 0x40D2
  LOAD r4, r7          ; piece_y
  LDI r7, 0x40D3
  LOAD r3, r7          ; piece_rot

  ; get piece color
  LDI r7, 0x42C0
  ADD r7, r5
  LOAD r20, r7          ; r20 = color

  ; compute piece data address
  LDI r11, 0
  ADD r11, r5
  LDI r12, 64
  MUL r11, r12
  LDI r12, 0x4100
  ADD r11, r12
  LDI r12, 0
  ADD r12, r3
  LDI r8, 16
  MUL r12, r8
  ADD r11, r12

  LDI r13, 0
lp_row:
  LDI r7, 0
  ADD r7, r11
  ADD r7, r13
  LOAD r14, r7

  LDI r16, 0
lp_col:
  ; extract bit
  LDI r7, 3
  LDI r12, 0
  ADD r12, r16
  SUB r7, r12
  LDI r12, 0
  ADD r12, r14
  LDI r8, 0
  ADD r8, r7
  SHR r12, r8
  LDI r8, 1
  AND r12, r8

  JZ r12, lp_next

  ; bounds check
  LDI r7, 0
  ADD r7, r4
  ADD r7, r13           ; row
  LDI r8, 20
  CMP r7, r8
  BGE r9, lp_next

  ; write color to board
  LDI r12, 0
  ADD r12, r4
  ADD r12, r13
  LDI r8, 10
  MUL r12, r8
  LDI r8, 0
  ADD r8, r10
  ADD r8, r16
  ADD r12, r8
  LDI r7, 0x4000
  ADD r7, r12
  STORE r7, r20

lp_next:
  LDI r12, 1
  ADD r16, r12
  LDI r8, 4
  CMP r16, r8
  BLT r9, lp_col

  LDI r12, 1
  ADD r13, r12
  LDI r8, 4
  CMP r13, r8
  BLT r9, lp_row

  ; lock sound
  LDI r12, 330
  LDI r8, 30
  BEEP r12, r8

  RET

; -----------------------------------------------------------------
; SUBROUTINE: clear_lines -- scan for full rows and clear them
;   Updates score and lines_cleared
; -----------------------------------------------------------------
clear_lines:
  PUSH r31
  LDI r25, 0            ; lines cleared this turn

  ; scan from bottom row (row 19) to top (row 0)
  LDI r13, 19
cl_row:
  ; check if row is full
  LDI r16, 0
  LDI r14, 1             ; assume full

  ; check 10 cells
  LDI r5, 0
cl_check:
  LDI r12, 0
  ADD r12, r13
  LDI r8, 10
  MUL r12, r8
  ADD r12, r5
  LDI r7, 0x4000
  ADD r7, r12
  LOAD r11, r7
  JZ r11, cl_not_full     ; empty cell = not full
  LDI r12, 1
  ADD r5, r12
  LDI r8, 10
  CMP r5, r8
  BLT r9, cl_check
  ; all 10 cells occupied = full row
  JMP cl_do_clear

cl_not_full:
  LDI r12, 1
  SUB r13, r12
  LDI r8, 0
  ; use BLT with signed comparison: if row < 0, unsigned wraps, but
  ; we compare with 0 as unsigned. If r13 was 0 and we subtract 1,
  ; it becomes 0xFFFFFFFF which is >= 0. So we need a different approach.
  ; Use CMP: if r13 < 0 (as signed), CMP with 0 would show BLT.
  ; But we use unsigned CMP. Let's just check if r13 > 19 or == 0xFFFFFFFF.
  ; Actually: CMP r13, r8 where r8=0 and using BLT: unsigned 0xFFFFFFFF > 0,
  ; so BLT won't trigger. We need a different sentinel.
  ; Fix: check if r13 < 0 by checking if r13 >= 0x80000000 (sign bit set)
  LDI r8, 0x80000000
  CMP r13, r8
  BGE r9, cl_done        ; sign bit set = underflow = done
  JMP cl_row

cl_do_clear:
  ; shift all rows above this one down by 1
  ; row r13 is full: copy row r13-1 to r13, r13-2 to r13-1, etc.
  LDI r14, 0             ; src row = r13 - 1
  LDI r12, 1
  SUB r14, r13
  LDI r12, 1
  ; wait, r14 = r13, then subtract 1
  LDI r14, 0
  ADD r14, r13

cl_shift:
  ; src_row = r14 - 1
  LDI r12, 0
  ADD r12, r14
  LDI r8, 1
  SUB r12, r8            ; r12 = src_row = r14 - 1
  ; if src_row < 0 (sign bit), we're at top, clear row 0 and stop
  LDI r8, 0x80000000
  CMP r12, r8
  BGE r9, cl_clear_top

  ; copy src_row to r14
  LDI r5, 0
cl_copy:
  ; src: board[src_row * 10 + col]
  LDI r7, 0
  ADD r7, r12
  LDI r8, 10
  MUL r7, r8
  ADD r7, r5
  LDI r2, 0x4000
  ADD r2, r7
  LOAD r11, r2           ; src cell

  ; dst: board[r14 * 10 + col]
  LDI r7, 0
  ADD r7, r14
  LDI r8, 10
  MUL r7, r8
  ADD r7, r5
  LDI r2, 0x4000
  ADD r2, r7
  STORE r2, r11          ; dst cell

  LDI r8, 1
  ADD r5, r8
  LDI r2, 10
  CMP r5, r2
  BLT r9, cl_copy

  LDI r8, 1
  SUB r14, r8
  ; check if r14 went below 0
  LDI r8, 0x80000000
  CMP r14, r8
  BGE r9, cl_clear_top
  JMP cl_shift

cl_clear_top:
  ; clear row 0
  LDI r5, 0
cl_clr:
  LDI r7, 0x4000
  ADD r7, r5
  LDI r11, 0
  STORE r7, r11
  LDI r12, 1
  ADD r5, r12
  LDI r8, 10
  CMP r5, r8
  BLT r9, cl_clr

  ; increment lines cleared this turn
  LDI r12, 1
  ADD r25, r12

  ; continue scanning from same row (shifted rows might also be full)
  JMP cl_row

cl_done:
  ; r25 = lines cleared this turn
  JZ r25, cl_ret
  
  ; Update score based on r25
  LDI r7, 0x40D4
  LOAD r11, r7           ; r11 = current score
  
  LDI r8, 1
  CMP r25, r8
  JZ r9, score_1
  
  LDI r8, 2
  CMP r25, r8
  JZ r9, score_2
  
  LDI r8, 3
  CMP r25, r8
  JZ r9, score_3
  
  ; 4 lines (Tetris)
  LDI r12, 800
  ADD r11, r12
  JMP score_stored

score_1:
  LDI r12, 100
  ADD r11, r12
  JMP score_stored
score_2:
  LDI r12, 300
  ADD r11, r12
  JMP score_stored
score_3:
  LDI r12, 500
  ADD r11, r12

score_stored:
  LDI r7, 0x40D4
  STORE r7, r11
  
  ; Clear sound
  LDI r12, 880
  LDI r8, 100
  BEEP r12, r8

  ; Update total lines_cleared
  LDI r7, 0x40D5
  LOAD r11, r7
  ADD r11, r25
  LDI r7, 0x40D5
  STORE r7, r11
  
  ; Update level = total_lines / 10
  LDI r1, 0
  ADD r1, r11
  LDI r15, 10
  DIV r1, r15
  LDI r7, 0x40DA
  STORE r7, r1

cl_ret:
  POP r31
  RET

; -----------------------------------------------------------------
; SUBROUTINE: spawn_piece -- next piece becomes current, pick new next
; -----------------------------------------------------------------
spawn_piece:
  PUSH r31
  ; copy next_piece to current_piece
  LDI r7, 0x40D7
  LOAD r11, r7
  LDI r7, 0x40D0
  STORE r7, r11           ; current_piece = next_piece

  ; pick new next_piece
  RAND r11
  LDI r1, 7
  MOD r11, r1
  LDI r7, 0x40D7
  STORE r7, r11

  ; reset piece state
  LDI r11, 3             ; start at column 3 (centered)
  LDI r7, 0x40D1
  STORE r7, r11           ; piece_x = 3
  LDI r11, 0
  LDI r7, 0x40D2
  STORE r7, r11           ; piece_y = 0 (top)
  LDI r11, 0
  LDI r7, 0x40D3
  STORE r7, r11           ; piece_rot = 0
  LDI r11, 0
  LDI r7, 0x40D9
  STORE r7, r11           ; drop_counter = 0

  ; check if new piece collides immediately = game over
  CALL check_collision
  JNZ r11, sp_ok
  ; collision at spawn = game over
  LDI r11, 1
  LDI r7, 0x40D6
  STORE r7, r11
  ; game over sound
  LDI r12, 110
  LDI r8, 300
  BEEP r12, r8
sp_ok:
  POP r31
  RET

; -- game over screen ---------------------------------------------
game_over_screen:
  LDI r11, 0x220000
  FILL r11
  FRAME
  IKEY r2
  JZ r2, game_over_screen
  JMP restart

; -- draw ---------------------------------------------------------
draw_and_loop:
  CALL draw_frame
  FRAME
  JMP game_loop

; -----------------------------------------------------------------
; SUBROUTINE: draw_frame -- render board, piece, UI
; -----------------------------------------------------------------
draw_frame:
  ; dark background
  LDI r11, 0x000811
  FILL r11

  ; draw board cells
  LDI r13, 0            ; row
df_brow:
  LDI r16, 0            ; col
df_bcol:
  ; board[row * 10 + col]
  LDI r12, 0
  ADD r12, r13
  LDI r8, 10
  MUL r12, r8
  ADD r12, r16
  LDI r7, 0x4000
  ADD r7, r12
  LOAD r20, r7          ; cell color (0=empty)

  JZ r20, df_bskip

  ; pixel x = 10 + col * 12
  LDI r12, 0
  ADD r12, r16
  LDI r8, 12
  MUL r12, r8
  LDI r8, 10
  ADD r12, r8            ; px_x

  ; pixel y = 8 + row * 12
  LDI r8, 0
  ADD r8, r13
  LDI r2, 12
  MUL r8, r2
  LDI r2, 8
  ADD r8, r2            ; px_y

  LDI r21, 11           ; width (12-1 for 1px gap)
  LDI r22, 11           ; height
  RECTF r12, r8, r21, r22, r20

df_bskip:
  LDI r12, 1
  ADD r16, r12
  LDI r8, 10
  CMP r16, r8
  BLT r9, df_bcol

  LDI r12, 1
  ADD r13, r12
  LDI r8, 20
  CMP r13, r8
  BLT r9, df_brow

  ; draw current piece
  CALL draw_piece

  ; draw board border
  ; left edge: x=9, y=8, w=1, h=240
  LDI r12, 9
  LDI r8, 8
  LDI r2, 1
  LDI r0, 240
  LDI r6, 0x555555
  RECTF r12, r8, r2, r0, r6
  ; right edge: x=130, y=8, w=1, h=240
  LDI r12, 130
  RECTF r12, r8, r2, r0, r6
  ; bottom edge: x=9, y=248, w=122, h=1
  LDI r12, 9
  LDI r8, 248
  LDI r2, 122
  LDI r0, 1
  RECTF r12, r8, r2, r0, r6

  ; draw score
  CALL draw_score

  ; draw lines
  CALL draw_lines

  ; draw level
  CALL draw_level

  ; draw next piece preview
  CALL draw_next

  RET

; -----------------------------------------------------------------
; SUBROUTINE: draw_piece -- draw current falling piece
; -----------------------------------------------------------------
draw_piece:
  LDI r7, 0x40D6
  LOAD r11, r7
  JNZ r11, dp_ret         ; game over, don't draw piece

  LDI r7, 0x40D0
  LOAD r5, r7
  LDI r7, 0x40D1
  LOAD r10, r7
  LDI r7, 0x40D2
  LOAD r4, r7
  LDI r7, 0x40D3
  LOAD r3, r7

  ; get color
  LDI r7, 0x42C0
  ADD r7, r5
  LOAD r20, r7

  ; compute data address
  LDI r11, 0
  ADD r11, r5
  LDI r12, 64
  MUL r11, r12
  LDI r12, 0x4100
  ADD r11, r12
  LDI r12, 0
  ADD r12, r3
  LDI r8, 16
  MUL r12, r8
  ADD r11, r12

  LDI r13, 0
dp_row:
  LDI r7, 0
  ADD r7, r11
  ADD r7, r13
  LOAD r14, r7

  LDI r16, 0
dp_col:
  ; extract bit
  LDI r7, 3
  LDI r12, 0
  ADD r12, r16
  SUB r7, r12
  LDI r12, 0
  ADD r12, r14
  LDI r8, 0
  ADD r8, r7
  SHR r12, r8
  LDI r8, 1
  AND r12, r8

  JZ r12, dp_next

  ; only draw if on screen (row >= 0)
  LDI r7, 0
  ADD r7, r4
  ADD r7, r13           ; board row
  LDI r8, 20
  CMP r7, r8
  BGE r9, dp_next

  ; pixel coords
  LDI r12, 0
  ADD r12, r10
  ADD r12, r16
  LDI r8, 12
  MUL r12, r8
  LDI r8, 10
  ADD r12, r8            ; px_x

  LDI r8, 0
  ADD r8, r4
  ADD r8, r13
  LDI r2, 12
  MUL r8, r2
  LDI r2, 8
  ADD r8, r2            ; px_y

  LDI r21, 11
  LDI r22, 11
  RECTF r12, r8, r21, r22, r20

dp_next:
  LDI r12, 1
  ADD r16, r12
  LDI r8, 4
  CMP r16, r8
  BLT r9, dp_col

  LDI r12, 1
  ADD r13, r12
  LDI r8, 4
  CMP r13, r8
  BLT r9, dp_row

dp_ret:
  RET

; -----------------------------------------------------------------
; SUBROUTINE: draw_score -- display score on right panel
; -----------------------------------------------------------------
draw_score:
  ; score text "SCORE:" at 0x4200..0x4205
  LDI r7, 0x4300
  LDI r11, 83
  STORE r7, r11
  LDI r7, 0x4301
  LDI r11, 67
  STORE r7, r11
  LDI r7, 0x4302
  LDI r11, 79
  STORE r7, r11
  LDI r7, 0x4303
  LDI r11, 82
  STORE r7, r11
  LDI r7, 0x4304
  LDI r11, 69
  STORE r7, r11
  LDI r7, 0x4305
  LDI r11, 58
  STORE r7, r11

  ; convert score to 5 digits
  LDI r7, 0x40D4
  LOAD r11, r7           ; score

  ; ten-thousands
  LDI r1, 0
  ADD r1, r11
  LDI r15, 10000
  DIV r1, r15
  LDI r12, 48
  ADD r1, r12
  LDI r7, 0x4306
  STORE r7, r1

  ; thousands
  LDI r1, 0
  ADD r1, r11
  LDI r15, 10000
  LDI r8, 0
  ADD r8, r7
  LOAD r8, r8
  LDI r12, 48
  SUB r8, r12
  MUL r8, r15
  SUB r1, r8
  LDI r15, 1000
  DIV r1, r15
  LDI r12, 48
  ADD r1, r12
  LDI r7, 0x4307
  STORE r7, r1

  ; hundreds
  LDI r1, 0
  ADD r1, r11
  LDI r15, 10000
  LDI r8, 0
  ADD r8, r7
  LOAD r8, r8
  LDI r12, 48
  SUB r8, r12
  MUL r8, r15
  LDI r7, 0x4307
  LOAD r2, r7
  LDI r12, 48
  SUB r2, r12
  LDI r15, 1000
  MUL r2, r15
  ADD r8, r2
  SUB r1, r8
  LDI r15, 100
  DIV r1, r15
  LDI r12, 48
  ADD r1, r12
  LDI r7, 0x4308
  STORE r7, r1

  ; tens
  LDI r1, 0
  ADD r1, r11
  ; subtract (10000*tth + 1000*th + 100*h)
  ; simpler: score mod 100 / 10
  LDI r15, 100
  MOD r1, r15
  LDI r15, 10
  DIV r1, r15
  LDI r12, 48
  ADD r1, r12
  LDI r7, 0x4309
  STORE r7, r1

  ; ones
  LDI r1, 0
  ADD r1, r11
  LDI r15, 10
  MOD r1, r15
  LDI r12, 48
  ADD r1, r12
  LDI r7, 0x430A
  STORE r7, r1

  ; null terminator
  LDI r11, 0
  LDI r7, 0x430B
  STORE r7, r11

  ; render
  LDI r12, 138
  LDI r8, 10
  LDI r2, 0x4300
  TEXT r12, r8, r2

  RET

; -----------------------------------------------------------------
; SUBROUTINE: draw_lines -- display lines cleared count
; -----------------------------------------------------------------
draw_lines:
  ; "LINES:" at 0x4210..0x4215
  LDI r7, 0x4310
  LDI r11, 76
  STORE r7, r11
  LDI r7, 0x4311
  LDI r11, 73
  STORE r7, r11
  LDI r7, 0x4312
  LDI r11, 78
  STORE r7, r11
  LDI r7, 0x4313
  LDI r11, 69
  STORE r7, r11
  LDI r7, 0x4314
  LDI r11, 83
  STORE r7, r11
  LDI r7, 0x4315
  LDI r11, 58
  STORE r7, r11

  ; lines count (max 999)
  LDI r7, 0x40D5
  LOAD r11, r7

  ; hundreds
  LDI r1, 0
  ADD r1, r11
  LDI r15, 100
  DIV r1, r15
  LDI r12, 48
  ADD r1, r12
  LDI r7, 0x4316
  STORE r7, r1

  ; tens
  LDI r1, 0
  ADD r1, r11
  LDI r15, 100
  MOD r1, r15
  LDI r15, 10
  DIV r1, r15
  LDI r12, 48
  ADD r1, r12
  LDI r7, 0x4317
  STORE r7, r1

  ; ones
  LDI r1, 0
  ADD r1, r11
  LDI r15, 10
  MOD r1, r15
  LDI r12, 48
  ADD r1, r12
  LDI r7, 0x4318
  STORE r7, r1

  ; null terminator
  LDI r11, 0
  LDI r7, 0x4319
  STORE r7, r11

  LDI r12, 138
  LDI r8, 26
  LDI r2, 0x4310
  TEXT r12, r8, r2

  RET

; -----------------------------------------------------------------
; SUBROUTINE: draw_next -- preview next piece
; -----------------------------------------------------------------
draw_next:
  ; "NEXT:" label
  LDI r7, 0x4320
  LDI r11, 78
  STORE r7, r11
  LDI r7, 0x4321
  LDI r11, 69
  STORE r7, r11
  LDI r7, 0x4322
  LDI r11, 88
  STORE r7, r11
  LDI r7, 0x4323
  LDI r11, 84
  STORE r7, r11
  LDI r7, 0x4324
  LDI r11, 58
  STORE r7, r11

  LDI r12, 138
  LDI r8, 50
  LDI r2, 0x4320
  TEXT r12, r8, r2

  ; draw the next piece in preview area
  LDI r7, 0x40D7
  LOAD r5, r7          ; next piece index

  ; get color
  LDI r7, 0x42C0
  ADD r7, r5
  LOAD r20, r7

  ; draw rotation 0
  LDI r11, 0
  ADD r11, r5
  LDI r12, 64
  MUL r11, r12
  LDI r12, 0x4100
  ADD r11, r12            ; r11 = base address

  LDI r13, 0
dn_row:
  LDI r7, 0
  ADD r7, r11
  ADD r7, r13
  LOAD r14, r7

  LDI r16, 0
dn_col:
  LDI r7, 3
  LDI r12, 0
  ADD r12, r16
  SUB r7, r12
  LDI r12, 0
  ADD r12, r14
  LDI r8, 0
  ADD r8, r7
  SHR r12, r8
  LDI r8, 1
  AND r12, r8

  JZ r12, dn_next

  ; preview at x=148, y=66, 8px per cell
  LDI r12, 0
  ADD r12, r16
  LDI r8, 8
  MUL r12, r8
  LDI r8, 148
  ADD r12, r8

  LDI r8, 0
  ADD r8, r13
  LDI r2, 8
  MUL r8, r2
  LDI r2, 66
  ADD r8, r2

  LDI r21, 7
  LDI r22, 7
  RECTF r12, r8, r21, r22, r20

dn_next:
  LDI r12, 1
  ADD r16, r12
  LDI r8, 4
  CMP r16, r8
  BLT r9, dn_col

  LDI r12, 1
  ADD r13, r12
  LDI r8, 4
  CMP r13, r8
  BLT r9, dn_row

  RET

; -----------------------------------------------------------------
; SUBROUTINE: draw_level -- display level
; -----------------------------------------------------------------
draw_level:
  ; "LEVEL:" at 0x4330..0x4335
  LDI r7, 0x4330
  LDI r11, 76
  STORE r7, r11 ; L
  LDI r7, 0x4331
  LDI r11, 69
  STORE r7, r11 ; E
  LDI r7, 0x4332
  LDI r11, 86
  STORE r7, r11 ; V
  LDI r7, 0x4333
  LDI r11, 69
  STORE r7, r11 ; E
  LDI r7, 0x4334
  LDI r11, 76
  STORE r7, r11 ; L
  LDI r7, 0x4335
  LDI r11, 58
  STORE r7, r11 ; :
  
  LDI r7, 0x40DA
  LOAD r11, r7 ; level
  
  ; tens
  LDI r1, 0
  ADD r1, r11
  LDI r15, 10
  DIV r1, r15
  LDI r12, 48
  ADD r1, r12
  LDI r7, 0x4336
  STORE r7, r1
  
  ; ones
  LDI r1, 0
  ADD r1, r11
  LDI r15, 10
  MOD r1, r15
  LDI r12, 48
  ADD r1, r12
  LDI r7, 0x4337
  STORE r7, r1
  
  ; null
  LDI r11, 0
  LDI r7, 0x4338
  STORE r7, r11
  
  ; render
  LDI r12, 138
  LDI r8, 50
  LDI r2, 0x4330
  TEXT r12, r8, r2
  RET
