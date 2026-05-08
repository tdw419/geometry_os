; DESCRIPTION: The assembly code implements a Tetris game for the Geometry OS. The game features a play area of 10 columns and 20 rows, with controls for moving pieces left/right, rotating, soft dropping, hard dropping, and restarting the game. It initializes piece data, colors, and game state, then enters a main loop where it handles input, updates piece positions, checks for collisions, locks settled pieces onto the board, clears full lines, and spawns new pieces. The game also includes drawing routines to render the board, pieces, score, lines cleared, level, and next piece preview on a 256x256 screen.

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
  LDI r6, 0
  LDI r10, 160          ; 10 * 20 = 200 cells... wait, 10*20=200
  ; actually 10 cols * 20 rows = 200
clear_board:
  LDI r11, 0x4000
  ADD r11, r6
  LDI r2, 0
  STORE r11, r2
  LDI r4, 1
  ADD r6, r4
  LDI r0, 200
  CMP r6, r0
  BLT r3, clear_board

  ; reset game state
  LDI r2, 0
  LDI r11, 0x40D4
  STORE r11, r2           ; score = 0
  LDI r2, 0
  LDI r11, 0x40D5
  STORE r11, r2           ; lines_cleared = 0
  LDI r2, 0
  LDI r11, 0x40D6
  STORE r11, r2           ; game_over = 0
  LDI r2, 0
  LDI r11, 0x40D8
  STORE r11, r2           ; soft_drop = 0
  LDI r2, 0
  LDI r11, 0x40D9
  STORE r11, r2           ; drop_counter = 0
  LDI r2, 0
  LDI r11, 0x40DA
  STORE r11, r2           ; level = 0

  ; pick first and next piece
  RAND r2
  LDI r1, 7
  MOD r2, r1
  LDI r11, 0x40D7
  STORE r11, r2           ; next_piece
  CALL spawn_piece

; -- main loop ------------------------------------------------------

init_pieces:
  ; Piece 0 (I)
  ; rot0: rows 0,1,2,3 = 0,0,15,0 (XXXX in row 2)
  LDI r11, 0x4100
  LDI r2, 0
  STORE r11, r2
  LDI r11, 0x4101
  LDI r2, 0
  STORE r11, r2
  LDI r11, 0x4102
  LDI r2, 15
  STORE r11, r2
  LDI r11, 0x4103
  LDI r2, 0
  STORE r11, r2
  ; rot1: rows = 4,4,4,4 (.X.. each row = 0100 = 4)
  LDI r11, 0x4104
  LDI r2, 4
  STORE r11, r2
  LDI r11, 0x4105
  LDI r2, 4
  STORE r11, r2
  LDI r11, 0x4106
  LDI r2, 4
  STORE r11, r2
  LDI r11, 0x4107
  LDI r2, 4
  STORE r11, r2
  ; rot2: rows = 0,0,15,0
  LDI r11, 0x4108
  LDI r2, 0
  STORE r11, r2
  LDI r11, 0x4109
  LDI r2, 0
  STORE r11, r2
  LDI r11, 0x410A
  LDI r2, 15
  STORE r11, r2
  LDI r11, 0x410B
  LDI r2, 0
  STORE r11, r2
  ; rot3: rows = 2,2,2,2 (..X. = 0010 = 2)
  LDI r11, 0x410C
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x410D
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x410E
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x410F
  LDI r2, 2
  STORE r11, r2

  ; Piece 1 (O)
  ; all rotations: 6,6,0,0 (.XX. = 0110 = 6)
  LDI r6, 0x4140
ip_o_loop:
  LDI r2, 6
  STORE r6, r2
  LDI r4, 1
  ADD r6, r4
  LDI r2, 6
  STORE r6, r2
  LDI r4, 1
  ADD r6, r4
  LDI r2, 0
  STORE r6, r2
  LDI r4, 1
  ADD r6, r4
  LDI r2, 0
  STORE r6, r2
  LDI r4, 1
  ADD r6, r4
  LDI r0, 0x4160
  CMP r6, r0
  BLT r3, ip_o_loop

  ; Piece 2 (T)
  ; rot0: 2,7,0,0 (.X. XXX .... ....)
  LDI r11, 0x4180
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x4181
  LDI r2, 7
  STORE r11, r2
  LDI r11, 0x4282
  LDI r2, 0
  STORE r11, r2
  LDI r11, 0x4283
  LDI r2, 0
  STORE r11, r2
  ; rot1: 2,3,2,0 (.X. .XX .X. ....)
  LDI r11, 0x4284
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x4285
  LDI r2, 3
  STORE r11, r2
  LDI r11, 0x4286
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x4287
  LDI r2, 0
  STORE r11, r2
  ; rot2: 0,7,2,0 (.... XXX .X. ....)
  LDI r11, 0x4288
  LDI r2, 0
  STORE r11, r2
  LDI r11, 0x4289
  LDI r2, 7
  STORE r11, r2
  LDI r11, 0x428A
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x428B
  LDI r2, 0
  STORE r11, r2
  ; rot3: 2,6,2,0 (X.. .XX .X. ....)
  LDI r11, 0x428C
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x428D
  LDI r2, 6
  STORE r11, r2
  LDI r11, 0x428E
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x428F
  LDI r2, 0
  STORE r11, r2

  ; Piece 3 (S)
  ; rot0: 3,3,0,0  (..XX .XX. .... ....) -- wait let me recalculate
  ; .XX. = 0110 = 6, XX.. = 1100 = 12
  ; rot0: 6,3,0,0
  LDI r11, 0x41C0
  LDI r2, 6
  STORE r11, r2
  LDI r11, 0x41C1
  LDI r2, 3
  STORE r11, r2
  LDI r11, 0x41C2
  LDI r2, 0
  STORE r11, r2
  LDI r11, 0x41C3
  LDI r2, 0
  STORE r11, r2
  ; rot1: 2,3,1,0  (.X. .XX ..X. ....)
  LDI r11, 0x41C4
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x41C5
  LDI r2, 3
  STORE r11, r2
  LDI r11, 0x41C6
  LDI r2, 1
  STORE r11, r2
  LDI r11, 0x41C7
  LDI r2, 0
  STORE r11, r2
  ; rot2: 0,6,3,0  (.... .XX. ..XX ....)
  LDI r11, 0x41C8
  LDI r2, 0
  STORE r11, r2
  LDI r11, 0x41C9
  LDI r2, 6
  STORE r11, r2
  LDI r11, 0x41CA
  LDI r2, 3
  STORE r11, r2
  LDI r11, 0x41CB
  LDI r2, 0
  STORE r11, r2
  ; rot3: 2,6,4,0  (X.. .XX XX.. ....)
  LDI r11, 0x41CC
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x41CD
  LDI r2, 6
  STORE r11, r2
  LDI r11, 0x41CE
  LDI r2, 4
  STORE r11, r2
  LDI r11, 0x41CF
  LDI r2, 0
  STORE r11, r2

  ; Piece 4 (Z)
  ; rot0: 3,6,0,0  (..XX .XX. .... ....)
  LDI r11, 0x4300
  LDI r2, 3
  STORE r11, r2
  LDI r11, 0x4301
  LDI r2, 6
  STORE r11, r2
  LDI r11, 0x4302
  LDI r2, 0
  STORE r11, r2
  LDI r11, 0x4303
  LDI r2, 0
  STORE r11, r2
  ; rot1: 1,3,2,0  (..X. .XX. .X.. ....)
  LDI r11, 0x4304
  LDI r2, 1
  STORE r11, r2
  LDI r11, 0x4305
  LDI r2, 3
  STORE r11, r2
  LDI r11, 0x4306
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x4307
  LDI r2, 0
  STORE r11, r2
  ; rot2: 0,3,6,0  (.... ..XX .XX. ....)
  LDI r11, 0x4308
  LDI r2, 0
  STORE r11, r2
  LDI r11, 0x4309
  LDI r2, 3
  STORE r11, r2
  LDI r11, 0x430A
  LDI r2, 6
  STORE r11, r2
  LDI r11, 0x430B
  LDI r2, 0
  STORE r11, r2
  ; rot3: 4,6,2,0  (XX.. .XX. .X.. ....)
  LDI r11, 0x420C
  LDI r2, 4
  STORE r11, r2
  LDI r11, 0x420D
  LDI r2, 6
  STORE r11, r2
  LDI r11, 0x420E
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x420F
  LDI r2, 0
  STORE r11, r2

  ; Piece 5 (L)
  ; rot0: 1,1,3,0  (X.. X.. .XX. ....)
  LDI r11, 0x4240
  LDI r2, 1
  STORE r11, r2
  LDI r11, 0x4241
  LDI r2, 1
  STORE r11, r2
  LDI r11, 0x4242
  LDI r2, 3
  STORE r11, r2
  LDI r11, 0x4243
  LDI r2, 0
  STORE r11, r2
  ; rot1: 2,2,6,0  (.X. .X. .XX. ....)
  LDI r11, 0x4244
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x4245
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x4246
  LDI r2, 6
  STORE r11, r2
  LDI r11, 0x4247
  LDI r2, 0
  STORE r11, r2
  ; rot2: 0,7,4,0  (.... XXX. XX.. ....)
  LDI r11, 0x4248
  LDI r2, 0
  STORE r11, r2
  LDI r11, 0x4249
  LDI r2, 7
  STORE r11, r2
  LDI r11, 0x424A
  LDI r2, 4
  STORE r11, r2
  LDI r11, 0x424B
  LDI r2, 0
  STORE r11, r2
  ; rot3: 2,6,2,0  (.X. .XX. .X. ....)
  LDI r11, 0x424C
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x424D
  LDI r2, 6
  STORE r11, r2
  LDI r11, 0x424E
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x424F
  LDI r2, 0
  STORE r11, r2

  ; Piece 6 (J)
  ; rot0: 4,4,6,0  (XX.. XX.. .XX. ....)
  LDI r11, 0x4280
  LDI r2, 4
  STORE r11, r2
  LDI r11, 0x4281
  LDI r2, 4
  STORE r11, r2
  LDI r11, 0x4182
  LDI r2, 6
  STORE r11, r2
  LDI r11, 0x4183
  LDI r2, 0
  STORE r11, r2
  ; rot1: 6,2,2,0  (.XX. .X.. .X.. ....)
  LDI r11, 0x4184
  LDI r2, 6
  STORE r11, r2
  LDI r11, 0x4185
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x4186
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x4187
  LDI r2, 0
  STORE r11, r2
  ; rot2: 0,7,1,0  (.... .XXX ..X. ....)
  LDI r11, 0x4188
  LDI r2, 0
  STORE r11, r2
  LDI r11, 0x4189
  LDI r2, 7
  STORE r11, r2
  LDI r11, 0x418A
  LDI r2, 1
  STORE r11, r2
  LDI r11, 0x418B
  LDI r2, 0
  STORE r11, r2
  ; rot3: 2,6,4,0  (.X. .XX. XX.. ....)
  LDI r11, 0x418C
  LDI r2, 2
  STORE r11, r2
  LDI r11, 0x418D
  LDI r2, 6
  STORE r11, r2
  LDI r11, 0x418E
  LDI r2, 4
  STORE r11, r2
  LDI r11, 0x418F
  LDI r2, 0
  STORE r11, r2

  RET

; -- Piece colors (stored at 0x42C0, one per piece) ----------------
; 0=I cyan, 1=O yellow, 2=T purple, 3=S green, 4=Z red, 5=L orange, 6=J blue
init_colors:
  LDI r11, 0x42C0
  LDI r2, 0x00CCCC     ; I - cyan
  STORE r11, r2
  LDI r11, 0x42C1
  LDI r2, 0xCCCC00     ; O - yellow
  STORE r11, r2
  LDI r11, 0x42C2
  LDI r2, 0xAA00CC     ; T - purple
  STORE r11, r2
  LDI r11, 0x42C3
  LDI r2, 0x00CC44     ; S - green
  STORE r11, r2
  LDI r11, 0x42C4
  LDI r2, 0xCC2200     ; Z - red
  STORE r11, r2
  LDI r11, 0x42C5
  LDI r2, 0xFF8800     ; L - orange
  STORE r11, r2
  LDI r11, 0x42C6
  LDI r2, 0x2244CC     ; J - blue
  STORE r11, r2
  RET

; -- init / restart -------------------------------------------------
game_loop:
  ; check game over
  LDI r11, 0x40D6
  LOAD r2, r11
  JNZ r2, game_over_screen

  ; read keyboard
  IKEY r13

  ; A/a = move left
  LDI r0, 65
  CMP r13, r0
  JZ r3, do_left
  LDI r0, 97
  CMP r13, r0
  JZ r3, do_left

  ; D/d = move right
  LDI r0, 68
  CMP r13, r0
  JZ r3, do_right
  LDI r0, 100
  CMP r13, r0
  JZ r3, do_right

  ; W/w = rotate
  LDI r0, 87
  CMP r13, r0
  JZ r3, do_rotate
  LDI r0, 119
  CMP r13, r0
  JZ r3, do_rotate

  ; S/s = soft drop
  LDI r0, 83
  CMP r13, r0
  JZ r3, do_soft_drop
  LDI r0, 115
  CMP r13, r0
  JZ r3, do_soft_drop

  ; Space = hard drop
  LDI r0, 32
  CMP r13, r0
  JZ r3, do_hard_drop

  ; R/r = restart
  LDI r0, 82
  CMP r13, r0
  JZ r3, restart
  LDI r0, 114
  CMP r13, r0
  JZ r3, restart

after_input:
  ; auto-drop: check tick counter
  ; Normal speed: drop every 15 frames. Soft drop: every 3 frames.
  LDI r11, 0x40D9
  LOAD r2, r11           ; drop_counter
  LDI r4, 1
  ADD r2, r4
  LDI r11, 0x40D9
  STORE r11, r2

  ; check threshold
  LDI r11, 0x40D8
  LOAD r1, r11           ; soft_drop flag
  JNZ r1, soft_thresh
  
  ; normal threshold based on level: max(2, 15 - level)
  LDI r11, 0x40DA
  LOAD r14, r11           ; r14 = level
  LDI r0, 15
  SUB r0, r14            ; r0 = 15 - level
  
  ; clamp at 2
  LDI r13, 2
  CMP r0, r13
  BGE r3, speed_ok
  LDI r0, 2
speed_ok:
  LDI r11, 0x40D9
  LOAD r2, r11
  CMP r2, r0
  BLT r3, no_drop
  JMP do_drop
soft_thresh:
  LDI r11, 0x40D9
  LOAD r2, r11
  LDI r0, 3
  CMP r2, r0
  BLT r3, no_drop
do_drop:
  LDI r2, 0
  LDI r11, 0x40D9
  STORE r11, r2           ; reset counter
  CALL try_move_down
  JMP draw_and_loop
no_drop:
  JMP draw_and_loop

; -- input handlers -------------------------------------------------
do_left:
  PUSH r31
  LDI r11, 0x40D1
  LOAD r2, r11           ; piece_x
  LDI r4, 1
  SUB r2, r4
  ; try at new position
  LDI r11, 0x40D1
  STORE r11, r2
  CALL check_collision
  JNZ r2, left_ok       ; no collision, keep move
  ; collision: revert
  LDI r11, 0x40D1
  LOAD r2, r11
  LDI r4, 1
  ADD r2, r4
  LDI r11, 0x40D1
  STORE r11, r2
left_ok:
  ; move sound
  LDI r4, 440
  LDI r0, 20
  BEEP r4, r0
  POP r31
  JMP after_input

do_right:
  PUSH r31
  LDI r11, 0x40D1
  LOAD r2, r11
  LDI r4, 1
  ADD r2, r4
  LDI r11, 0x40D1
  STORE r11, r2
  CALL check_collision
  JNZ r2, right_ok
  ; revert
  LDI r11, 0x40D1
  LOAD r2, r11
  LDI r4, 1
  SUB r2, r4
  LDI r11, 0x40D1
  STORE r11, r2
right_ok:
  ; move sound
  LDI r4, 440
  LDI r0, 20
  BEEP r4, r0
  POP r31
  JMP after_input

do_rotate:
  PUSH r31
  LDI r11, 0x40D3
  LOAD r2, r11           ; piece_rot
  LDI r4, 1
  ADD r2, r4
  LDI r0, 4
  MOD r2, r0
  LDI r11, 0x40D3
  STORE r11, r2
  CALL check_collision
  JNZ r2, rot_ok
  ; revert rotation
  LDI r11, 0x40D3
  LOAD r2, r11
  LDI r4, 3
  ADD r2, r4
  LDI r0, 4
  MOD r2, r0
  LDI r11, 0x40D3
  STORE r11, r2
rot_ok:
  ; rotate sound
  LDI r4, 660
  LDI r0, 20
  BEEP r4, r0
  POP r31
  JMP after_input

do_soft_drop:
  LDI r2, 1
  LDI r11, 0x40D8
  STORE r11, r2
  JMP after_input

do_hard_drop:
  PUSH r31
  ; hard drop sound (start)
  LDI r4, 440
  LDI r0, 50
  BEEP r4, r0
hd_loop:
  ; move down until collision
  LDI r11, 0x40D2
  LOAD r2, r11           ; piece_y
  LDI r4, 1
  ADD r2, r4
  LDI r11, 0x40D2
  STORE r11, r2
  CALL check_collision
  JZ r2, hd_done        ; collision detected, piece at final pos
  JMP hd_loop
hd_done:
  ; revert the last move (we moved into collision)
  LDI r11, 0x40D2
  LOAD r2, r11
  LDI r4, 1
  SUB r2, r4
  LDI r11, 0x40D2
  STORE r11, r2
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
  LDI r11, 0x40D2
  LOAD r2, r11           ; piece_y
  LDI r4, 1
  ADD r2, r4
  LDI r11, 0x40D2
  STORE r11, r2
  CALL check_collision
  JNZ r2, tmd_ok        ; no collision, piece moved down
  ; collision: revert and lock
  LDI r11, 0x40D2
  LOAD r2, r11
  LDI r4, 1
  SUB r2, r4
  LDI r11, 0x40D2
  STORE r11, r2
  CALL lock_piece
  CALL clear_lines
  CALL spawn_piece
tmd_ok:
  POP r31
  RET

; -----------------------------------------------------------------
; SUBROUTINE: check_collision
;   Returns r2 = 0 if collision, 1 if no collision
;   Checks current piece position against board and walls
; -----------------------------------------------------------------
check_collision:
  ; load piece info
  LDI r11, 0x40D0
  LOAD r6, r11          ; current_piece index
  LDI r11, 0x40D1
  LOAD r10, r11          ; piece_x
  LDI r11, 0x40D2
  LOAD r5, r11          ; piece_y
  LDI r11, 0x40D3
  LOAD r12, r11          ; piece_rot

  ; compute piece data address: 0x4100 + piece * 64 + rot * 16
  LDI r2, 0
  ADD r2, r6
  LDI r4, 64
  MUL r2, r4
  LDI r4, 0x4100
  ADD r2, r4
  LDI r4, 0
  ADD r4, r12
  LDI r0, 16
  MUL r4, r0
  ADD r2, r4            ; r2 = base address of rotation data

  LDI r9, 0            ; row counter (0-3)
cc_row:
  ; load row bitmap
  LDI r11, 0
  ADD r11, r2
  ADD r11, r9
  LOAD r15, r11          ; r15 = row bitmap

  LDI r16, 0            ; col counter (0-3)
cc_col:
  ; check bit 3-col (MSB = leftmost in 4-bit field)
  ; we want bit at position (3 - col)
  LDI r11, 3
  LDI r4, 0
  ADD r4, r16
  SUB r11, r4            ; r11 = 3 - col
  ; shift right by r11, AND with 1
  LDI r4, 0
  ADD r4, r15
  LDI r0, 0
  ADD r0, r11
  SHR r4, r0            ; r4 = bitmap >> (3-col)
  LDI r0, 1
  AND r4, r0            ; r4 = bit

  JZ r4, cc_next        ; empty cell, skip

  ; check bounds
  ; board col = piece_x + col, must be 0..9
  LDI r11, 0
  ADD r11, r10
  ADD r11, r16           ; board col
  LDI r0, 0
  CMP r11, r0
  BLT r3, cc_collision
  LDI r0, 10
  CMP r11, r0
  BGE r3, cc_collision

  ; board row = piece_y + row, must be 0..19
  LDI r11, 0
  ADD r11, r5
  ADD r11, r9           ; board row
  LDI r0, 20
  CMP r11, r0
  BGE r3, cc_collision
  ; row < 0 (unsigned underflow) -- let it go (piece above board is ok)

  ; check board cell (only if row < 20)
  LDI r11, 0
  ADD r11, r5
  ADD r11, r9
  LDI r0, 20
  CMP r11, r0
  BGE r3, cc_next       ; above board, ok
  ; board[row * 10 + col]
  LDI r4, 0
  ADD r4, r5
  ADD r4, r9
  LDI r0, 10
  MUL r4, r0
  LDI r0, 0
  ADD r0, r10
  ADD r0, r16
  ADD r4, r0            ; board index
  LDI r11, 0x4000
  ADD r11, r4
  LOAD r4, r11           ; board cell
  JNZ r4, cc_collision  ; occupied = collision

cc_next:
  LDI r4, 1
  ADD r16, r4
  LDI r0, 4
  CMP r16, r0
  BLT r3, cc_col

  LDI r4, 1
  ADD r9, r4
  LDI r0, 4
  CMP r9, r0
  BLT r3, cc_row

  ; no collision
  LDI r2, 1
  RET

cc_collision:
  LDI r2, 0
  RET

; -----------------------------------------------------------------
; SUBROUTINE: lock_piece -- write piece into board
; -----------------------------------------------------------------
lock_piece:
  LDI r11, 0x40D0
  LOAD r6, r11          ; piece index
  LDI r11, 0x40D1
  LOAD r10, r11          ; piece_x
  LDI r11, 0x40D2
  LOAD r5, r11          ; piece_y
  LDI r11, 0x40D3
  LOAD r12, r11          ; piece_rot

  ; get piece color
  LDI r11, 0x42C0
  ADD r11, r6
  LOAD r20, r11          ; r20 = color

  ; compute piece data address
  LDI r2, 0
  ADD r2, r6
  LDI r4, 64
  MUL r2, r4
  LDI r4, 0x4100
  ADD r2, r4
  LDI r4, 0
  ADD r4, r12
  LDI r0, 16
  MUL r4, r0
  ADD r2, r4

  LDI r9, 0
lp_row:
  LDI r11, 0
  ADD r11, r2
  ADD r11, r9
  LOAD r15, r11

  LDI r16, 0
lp_col:
  ; extract bit
  LDI r11, 3
  LDI r4, 0
  ADD r4, r16
  SUB r11, r4
  LDI r4, 0
  ADD r4, r15
  LDI r0, 0
  ADD r0, r11
  SHR r4, r0
  LDI r0, 1
  AND r4, r0

  JZ r4, lp_next

  ; bounds check
  LDI r11, 0
  ADD r11, r5
  ADD r11, r9           ; row
  LDI r0, 20
  CMP r11, r0
  BGE r3, lp_next

  ; write color to board
  LDI r4, 0
  ADD r4, r5
  ADD r4, r9
  LDI r0, 10
  MUL r4, r0
  LDI r0, 0
  ADD r0, r10
  ADD r0, r16
  ADD r4, r0
  LDI r11, 0x4000
  ADD r11, r4
  STORE r11, r20

lp_next:
  LDI r4, 1
  ADD r16, r4
  LDI r0, 4
  CMP r16, r0
  BLT r3, lp_col

  LDI r4, 1
  ADD r9, r4
  LDI r0, 4
  CMP r9, r0
  BLT r3, lp_row

  ; lock sound
  LDI r4, 330
  LDI r0, 30
  BEEP r4, r0

  RET

; -----------------------------------------------------------------
; SUBROUTINE: clear_lines -- scan for full rows and clear them
;   Updates score and lines_cleared
; -----------------------------------------------------------------
clear_lines:
  PUSH r31
  LDI r25, 0            ; lines cleared this turn

  ; scan from bottom row (row 19) to top (row 0)
  LDI r9, 19
cl_row:
  ; check if row is full
  LDI r16, 0
  LDI r15, 1             ; assume full

  ; check 10 cells
  LDI r6, 0
cl_check:
  LDI r4, 0
  ADD r4, r9
  LDI r0, 10
  MUL r4, r0
  ADD r4, r6
  LDI r11, 0x4000
  ADD r11, r4
  LOAD r2, r11
  JZ r2, cl_not_full     ; empty cell = not full
  LDI r4, 1
  ADD r6, r4
  LDI r0, 10
  CMP r6, r0
  BLT r3, cl_check
  ; all 10 cells occupied = full row
  JMP cl_do_clear

cl_not_full:
  LDI r4, 1
  SUB r9, r4
  LDI r0, 0
  ; use BLT with signed comparison: if row < 0, unsigned wraps, but
  ; we compare with 0 as unsigned. If r9 was 0 and we subtract 1,
  ; it becomes 0xFFFFFFFF which is >= 0. So we need a different approach.
  ; Use CMP: if r9 < 0 (as signed), CMP with 0 would show BLT.
  ; But we use unsigned CMP. Let's just check if r9 > 19 or == 0xFFFFFFFF.
  ; Actually: CMP r9, r0 where r0=0 and using BLT: unsigned 0xFFFFFFFF > 0,
  ; so BLT won't trigger. We need a different sentinel.
  ; Fix: check if r9 < 0 by checking if r9 >= 0x80000000 (sign bit set)
  LDI r0, 0x80000000
  CMP r9, r0
  BGE r3, cl_done        ; sign bit set = underflow = done
  JMP cl_row

cl_do_clear:
  ; shift all rows above this one down by 1
  ; row r9 is full: copy row r9-1 to r9, r9-2 to r9-1, etc.
  LDI r15, 0             ; src row = r9 - 1
  LDI r4, 1
  SUB r15, r9
  LDI r4, 1
  ; wait, r15 = r9, then subtract 1
  LDI r15, 0
  ADD r15, r9

cl_shift:
  ; src_row = r15 - 1
  LDI r4, 0
  ADD r4, r15
  LDI r0, 1
  SUB r4, r0            ; r4 = src_row = r15 - 1
  ; if src_row < 0 (sign bit), we're at top, clear row 0 and stop
  LDI r0, 0x80000000
  CMP r4, r0
  BGE r3, cl_clear_top

  ; copy src_row to r15
  LDI r6, 0
cl_copy:
  ; src: board[src_row * 10 + col]
  LDI r11, 0
  ADD r11, r4
  LDI r0, 10
  MUL r11, r0
  ADD r11, r6
  LDI r13, 0x4000
  ADD r13, r11
  LOAD r2, r13           ; src cell

  ; dst: board[r15 * 10 + col]
  LDI r11, 0
  ADD r11, r15
  LDI r0, 10
  MUL r11, r0
  ADD r11, r6
  LDI r13, 0x4000
  ADD r13, r11
  STORE r13, r2          ; dst cell

  LDI r0, 1
  ADD r6, r0
  LDI r13, 10
  CMP r6, r13
  BLT r3, cl_copy

  LDI r0, 1
  SUB r15, r0
  ; check if r15 went below 0
  LDI r0, 0x80000000
  CMP r15, r0
  BGE r3, cl_clear_top
  JMP cl_shift

cl_clear_top:
  ; clear row 0
  LDI r6, 0
cl_clr:
  LDI r11, 0x4000
  ADD r11, r6
  LDI r2, 0
  STORE r11, r2
  LDI r4, 1
  ADD r6, r4
  LDI r0, 10
  CMP r6, r0
  BLT r3, cl_clr

  ; increment lines cleared this turn
  LDI r4, 1
  ADD r25, r4

  ; continue scanning from same row (shifted rows might also be full)
  JMP cl_row

cl_done:
  ; r25 = lines cleared this turn
  JZ r25, cl_ret
  
  ; Update score based on r25
  LDI r11, 0x40D4
  LOAD r2, r11           ; r2 = current score
  
  LDI r0, 1
  CMP r25, r0
  JZ r3, score_1
  
  LDI r0, 2
  CMP r25, r0
  JZ r3, score_2
  
  LDI r0, 3
  CMP r25, r0
  JZ r3, score_3
  
  ; 4 lines (Tetris)
  LDI r4, 800
  ADD r2, r4
  JMP score_stored

score_1:
  LDI r4, 100
  ADD r2, r4
  JMP score_stored
score_2:
  LDI r4, 300
  ADD r2, r4
  JMP score_stored
score_3:
  LDI r4, 500
  ADD r2, r4

score_stored:
  LDI r11, 0x40D4
  STORE r11, r2
  
  ; Clear sound
  LDI r4, 880
  LDI r0, 100
  BEEP r4, r0

  ; Update total lines_cleared
  LDI r11, 0x40D5
  LOAD r2, r11
  ADD r2, r25
  LDI r11, 0x40D5
  STORE r11, r2
  
  ; Update level = total_lines / 10
  LDI r1, 0
  ADD r1, r2
  LDI r14, 10
  DIV r1, r14
  LDI r11, 0x40DA
  STORE r11, r1

cl_ret:
  POP r31
  RET

; -----------------------------------------------------------------
; SUBROUTINE: spawn_piece -- next piece becomes current, pick new next
; -----------------------------------------------------------------
spawn_piece:
  PUSH r31
  ; copy next_piece to current_piece
  LDI r11, 0x40D7
  LOAD r2, r11
  LDI r11, 0x40D0
  STORE r11, r2           ; current_piece = next_piece

  ; pick new next_piece
  RAND r2
  LDI r1, 7
  MOD r2, r1
  LDI r11, 0x40D7
  STORE r11, r2

  ; reset piece state
  LDI r2, 3             ; start at column 3 (centered)
  LDI r11, 0x40D1
  STORE r11, r2           ; piece_x = 3
  LDI r2, 0
  LDI r11, 0x40D2
  STORE r11, r2           ; piece_y = 0 (top)
  LDI r2, 0
  LDI r11, 0x40D3
  STORE r11, r2           ; piece_rot = 0
  LDI r2, 0
  LDI r11, 0x40D9
  STORE r11, r2           ; drop_counter = 0

  ; check if new piece collides immediately = game over
  CALL check_collision
  JNZ r2, sp_ok
  ; collision at spawn = game over
  LDI r2, 1
  LDI r11, 0x40D6
  STORE r11, r2
  ; game over sound
  LDI r4, 110
  LDI r0, 300
  BEEP r4, r0
sp_ok:
  POP r31
  RET

; -- game over screen ---------------------------------------------
game_over_screen:
  LDI r2, 0x220000
  FILL r2
  FRAME
  IKEY r13
  JZ r13, game_over_screen
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
  LDI r2, 0x000811
  FILL r2

  ; draw board cells
  LDI r9, 0            ; row
df_brow:
  LDI r16, 0            ; col
df_bcol:
  ; board[row * 10 + col]
  LDI r4, 0
  ADD r4, r9
  LDI r0, 10
  MUL r4, r0
  ADD r4, r16
  LDI r11, 0x4000
  ADD r11, r4
  LOAD r20, r11          ; cell color (0=empty)

  JZ r20, df_bskip

  ; pixel x = 10 + col * 12
  LDI r4, 0
  ADD r4, r16
  LDI r0, 12
  MUL r4, r0
  LDI r0, 10
  ADD r4, r0            ; px_x

  ; pixel y = 8 + row * 12
  LDI r0, 0
  ADD r0, r9
  LDI r13, 12
  MUL r0, r13
  LDI r13, 8
  ADD r0, r13            ; px_y

  LDI r21, 11           ; width (12-1 for 1px gap)
  LDI r22, 11           ; height
  RECTF r4, r0, r21, r22, r20

df_bskip:
  LDI r4, 1
  ADD r16, r4
  LDI r0, 10
  CMP r16, r0
  BLT r3, df_bcol

  LDI r4, 1
  ADD r9, r4
  LDI r0, 20
  CMP r9, r0
  BLT r3, df_brow

  ; draw current piece
  CALL draw_piece

  ; draw board border
  ; left edge: x=9, y=8, w=1, h=240
  LDI r4, 9
  LDI r0, 8
  LDI r13, 1
  LDI r8, 240
  LDI r7, 0x555555
  RECTF r4, r0, r13, r8, r7
  ; right edge: x=130, y=8, w=1, h=240
  LDI r4, 130
  RECTF r4, r0, r13, r8, r7
  ; bottom edge: x=9, y=248, w=122, h=1
  LDI r4, 9
  LDI r0, 248
  LDI r13, 122
  LDI r8, 1
  RECTF r4, r0, r13, r8, r7

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
  LDI r11, 0x40D6
  LOAD r2, r11
  JNZ r2, dp_ret         ; game over, don't draw piece

  LDI r11, 0x40D0
  LOAD r6, r11
  LDI r11, 0x40D1
  LOAD r10, r11
  LDI r11, 0x40D2
  LOAD r5, r11
  LDI r11, 0x40D3
  LOAD r12, r11

  ; get color
  LDI r11, 0x42C0
  ADD r11, r6
  LOAD r20, r11

  ; compute data address
  LDI r2, 0
  ADD r2, r6
  LDI r4, 64
  MUL r2, r4
  LDI r4, 0x4100
  ADD r2, r4
  LDI r4, 0
  ADD r4, r12
  LDI r0, 16
  MUL r4, r0
  ADD r2, r4

  LDI r9, 0
dp_row:
  LDI r11, 0
  ADD r11, r2
  ADD r11, r9
  LOAD r15, r11

  LDI r16, 0
dp_col:
  ; extract bit
  LDI r11, 3
  LDI r4, 0
  ADD r4, r16
  SUB r11, r4
  LDI r4, 0
  ADD r4, r15
  LDI r0, 0
  ADD r0, r11
  SHR r4, r0
  LDI r0, 1
  AND r4, r0

  JZ r4, dp_next

  ; only draw if on screen (row >= 0)
  LDI r11, 0
  ADD r11, r5
  ADD r11, r9           ; board row
  LDI r0, 20
  CMP r11, r0
  BGE r3, dp_next

  ; pixel coords
  LDI r4, 0
  ADD r4, r10
  ADD r4, r16
  LDI r0, 12
  MUL r4, r0
  LDI r0, 10
  ADD r4, r0            ; px_x

  LDI r0, 0
  ADD r0, r5
  ADD r0, r9
  LDI r13, 12
  MUL r0, r13
  LDI r13, 8
  ADD r0, r13            ; px_y

  LDI r21, 11
  LDI r22, 11
  RECTF r4, r0, r21, r22, r20

dp_next:
  LDI r4, 1
  ADD r16, r4
  LDI r0, 4
  CMP r16, r0
  BLT r3, dp_col

  LDI r4, 1
  ADD r9, r4
  LDI r0, 4
  CMP r9, r0
  BLT r3, dp_row

dp_ret:
  RET

; -----------------------------------------------------------------
; SUBROUTINE: draw_score -- display score on right panel
; -----------------------------------------------------------------
draw_score:
  ; score text "SCORE:" at 0x4200..0x4205
  LDI r11, 0x4300
  LDI r2, 83
  STORE r11, r2
  LDI r11, 0x4301
  LDI r2, 67
  STORE r11, r2
  LDI r11, 0x4302
  LDI r2, 79
  STORE r11, r2
  LDI r11, 0x4303
  LDI r2, 82
  STORE r11, r2
  LDI r11, 0x4304
  LDI r2, 69
  STORE r11, r2
  LDI r11, 0x4305
  LDI r2, 58
  STORE r11, r2

  ; convert score to 5 digits
  LDI r11, 0x40D4
  LOAD r2, r11           ; score

  ; ten-thousands
  LDI r1, 0
  ADD r1, r2
  LDI r14, 10000
  DIV r1, r14
  LDI r4, 48
  ADD r1, r4
  LDI r11, 0x4306
  STORE r11, r1

  ; thousands
  LDI r1, 0
  ADD r1, r2
  LDI r14, 10000
  LDI r0, 0
  ADD r0, r11
  LOAD r0, r0
  LDI r4, 48
  SUB r0, r4
  MUL r0, r14
  SUB r1, r0
  LDI r14, 1000
  DIV r1, r14
  LDI r4, 48
  ADD r1, r4
  LDI r11, 0x4307
  STORE r11, r1

  ; hundreds
  LDI r1, 0
  ADD r1, r2
  LDI r14, 10000
  LDI r0, 0
  ADD r0, r11
  LOAD r0, r0
  LDI r4, 48
  SUB r0, r4
  MUL r0, r14
  LDI r11, 0x4307
  LOAD r13, r11
  LDI r4, 48
  SUB r13, r4
  LDI r14, 1000
  MUL r13, r14
  ADD r0, r13
  SUB r1, r0
  LDI r14, 100
  DIV r1, r14
  LDI r4, 48
  ADD r1, r4
  LDI r11, 0x4308
  STORE r11, r1

  ; tens
  LDI r1, 0
  ADD r1, r2
  ; subtract (10000*tth + 1000*th + 100*h)
  ; simpler: score mod 100 / 10
  LDI r14, 100
  MOD r1, r14
  LDI r14, 10
  DIV r1, r14
  LDI r4, 48
  ADD r1, r4
  LDI r11, 0x4309
  STORE r11, r1

  ; ones
  LDI r1, 0
  ADD r1, r2
  LDI r14, 10
  MOD r1, r14
  LDI r4, 48
  ADD r1, r4
  LDI r11, 0x430A
  STORE r11, r1

  ; null terminator
  LDI r2, 0
  LDI r11, 0x430B
  STORE r11, r2

  ; render
  LDI r4, 138
  LDI r0, 10
  LDI r13, 0x4300
  TEXT r4, r0, r13

  RET

; -----------------------------------------------------------------
; SUBROUTINE: draw_lines -- display lines cleared count
; -----------------------------------------------------------------
draw_lines:
  ; "LINES:" at 0x4210..0x4215
  LDI r11, 0x4310
  LDI r2, 76
  STORE r11, r2
  LDI r11, 0x4311
  LDI r2, 73
  STORE r11, r2
  LDI r11, 0x4312
  LDI r2, 78
  STORE r11, r2
  LDI r11, 0x4313
  LDI r2, 69
  STORE r11, r2
  LDI r11, 0x4314
  LDI r2, 83
  STORE r11, r2
  LDI r11, 0x4315
  LDI r2, 58
  STORE r11, r2

  ; lines count (max 999)
  LDI r11, 0x40D5
  LOAD r2, r11

  ; hundreds
  LDI r1, 0
  ADD r1, r2
  LDI r14, 100
  DIV r1, r14
  LDI r4, 48
  ADD r1, r4
  LDI r11, 0x4316
  STORE r11, r1

  ; tens
  LDI r1, 0
  ADD r1, r2
  LDI r14, 100
  MOD r1, r14
  LDI r14, 10
  DIV r1, r14
  LDI r4, 48
  ADD r1, r4
  LDI r11, 0x4317
  STORE r11, r1

  ; ones
  LDI r1, 0
  ADD r1, r2
  LDI r14, 10
  MOD r1, r14
  LDI r4, 48
  ADD r1, r4
  LDI r11, 0x4318
  STORE r11, r1

  ; null terminator
  LDI r2, 0
  LDI r11, 0x4319
  STORE r11, r2

  LDI r4, 138
  LDI r0, 26
  LDI r13, 0x4310
  TEXT r4, r0, r13

  RET

; -----------------------------------------------------------------
; SUBROUTINE: draw_next -- preview next piece
; -----------------------------------------------------------------
draw_next:
  ; "NEXT:" label
  LDI r11, 0x4320
  LDI r2, 78
  STORE r11, r2
  LDI r11, 0x4321
  LDI r2, 69
  STORE r11, r2
  LDI r11, 0x4322
  LDI r2, 88
  STORE r11, r2
  LDI r11, 0x4323
  LDI r2, 84
  STORE r11, r2
  LDI r11, 0x4324
  LDI r2, 58
  STORE r11, r2

  LDI r4, 138
  LDI r0, 50
  LDI r13, 0x4320
  TEXT r4, r0, r13

  ; draw the next piece in preview area
  LDI r11, 0x40D7
  LOAD r6, r11          ; next piece index

  ; get color
  LDI r11, 0x42C0
  ADD r11, r6
  LOAD r20, r11

  ; draw rotation 0
  LDI r2, 0
  ADD r2, r6
  LDI r4, 64
  MUL r2, r4
  LDI r4, 0x4100
  ADD r2, r4            ; r2 = base address

  LDI r9, 0
dn_row:
  LDI r11, 0
  ADD r11, r2
  ADD r11, r9
  LOAD r15, r11

  LDI r16, 0
dn_col:
  LDI r11, 3
  LDI r4, 0
  ADD r4, r16
  SUB r11, r4
  LDI r4, 0
  ADD r4, r15
  LDI r0, 0
  ADD r0, r11
  SHR r4, r0
  LDI r0, 1
  AND r4, r0

  JZ r4, dn_next

  ; preview at x=148, y=66, 8px per cell
  LDI r4, 0
  ADD r4, r16
  LDI r0, 8
  MUL r4, r0
  LDI r0, 148
  ADD r4, r0

  LDI r0, 0
  ADD r0, r9
  LDI r13, 8
  MUL r0, r13
  LDI r13, 66
  ADD r0, r13

  LDI r21, 7
  LDI r22, 7
  RECTF r4, r0, r21, r22, r20

dn_next:
  LDI r4, 1
  ADD r16, r4
  LDI r0, 4
  CMP r16, r0
  BLT r3, dn_col

  LDI r4, 1
  ADD r9, r4
  LDI r0, 4
  CMP r9, r0
  BLT r3, dn_row

  RET

; -----------------------------------------------------------------
; SUBROUTINE: draw_level -- display level
; -----------------------------------------------------------------
draw_level:
  ; "LEVEL:" at 0x4330..0x4335
  LDI r11, 0x4330
  LDI r2, 76
  STORE r11, r2 ; L
  LDI r11, 0x4331
  LDI r2, 69
  STORE r11, r2 ; E
  LDI r11, 0x4332
  LDI r2, 86
  STORE r11, r2 ; V
  LDI r11, 0x4333
  LDI r2, 69
  STORE r11, r2 ; E
  LDI r11, 0x4334
  LDI r2, 76
  STORE r11, r2 ; L
  LDI r11, 0x4335
  LDI r2, 58
  STORE r11, r2 ; :
  
  LDI r11, 0x40DA
  LOAD r2, r11 ; level
  
  ; tens
  LDI r1, 0
  ADD r1, r2
  LDI r14, 10
  DIV r1, r14
  LDI r4, 48
  ADD r1, r4
  LDI r11, 0x4336
  STORE r11, r1
  
  ; ones
  LDI r1, 0
  ADD r1, r2
  LDI r14, 10
  MOD r1, r14
  LDI r4, 48
  ADD r1, r4
  LDI r11, 0x4337
  STORE r11, r1
  
  ; null
  LDI r2, 0
  LDI r11, 0x4338
  STORE r11, r2
  
  ; render
  LDI r4, 138
  LDI r0, 50
  LDI r13, 0x4330
  TEXT r4, r0, r13
  RET
