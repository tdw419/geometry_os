; DESCRIPTION: This GeOS assembly code implements a Tetris game with a play area of 10 columns by 20 rows on a 256x256 screen. The game includes controls for moving pieces left and right (A/D), rotating (W), soft dropping (S), hard dropping (Space), and restarting the game (R). The code manages piece placement, collision detection, line clearing, scoring, and UI rendering, with subroutines handling specific tasks like drawing pieces, updating scores, and checking for game over conditions.

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
  LDI r3, 0
  LDI r1, 160          ; 10 * 20 = 200 cells... wait, 10*20=200
  ; actually 10 cols * 20 rows = 200
clear_board:
  LDI r5, 0x4000
  ADD r5, r3
  LDI r9, 0
  STORE r5, r9
  LDI r12, 1
  ADD r3, r12
  LDI r4, 200
  CMP r3, r4
  BLT r8, clear_board

  ; reset game state
  LDI r9, 0
  LDI r5, 0x40D4
  STORE r5, r9           ; score = 0
  LDI r9, 0
  LDI r5, 0x40D5
  STORE r5, r9           ; lines_cleared = 0
  LDI r9, 0
  LDI r5, 0x40D6
  STORE r5, r9           ; game_over = 0
  LDI r9, 0
  LDI r5, 0x40D8
  STORE r5, r9           ; soft_drop = 0
  LDI r9, 0
  LDI r5, 0x40D9
  STORE r5, r9           ; drop_counter = 0
  LDI r9, 0
  LDI r5, 0x40DA
  STORE r5, r9           ; level = 0

  ; pick first and next piece
  RAND r9
  LDI r15, 7
  MOD r9, r15
  LDI r5, 0x40D7
  STORE r5, r9           ; next_piece
  CALL spawn_piece
  JMP game_loop

; ── main loop ──────────────────────────────────────────────────────

init_pieces:
  ; Piece 0 (I)
  ; rot0: rows 0,1,2,3 = 0,0,15,0 (XXXX in row 2)
  LDI r5, 0x4100
  LDI r9, 0
  STORE r5, r9
  LDI r5, 0x4101
  LDI r9, 0
  STORE r5, r9
  LDI r5, 0x4102
  LDI r9, 15
  STORE r5, r9
  LDI r5, 0x4103
  LDI r9, 0
  STORE r5, r9
  ; rot1: rows = 4,4,4,4 (.X.. each row = 0100 = 4)
  LDI r5, 0x4104
  LDI r9, 4
  STORE r5, r9
  LDI r5, 0x4105
  LDI r9, 4
  STORE r5, r9
  LDI r5, 0x4106
  LDI r9, 4
  STORE r5, r9
  LDI r5, 0x4107
  LDI r9, 4
  STORE r5, r9
  ; rot2: rows = 0,0,15,0
  LDI r5, 0x4108
  LDI r9, 0
  STORE r5, r9
  LDI r5, 0x4109
  LDI r9, 0
  STORE r5, r9
  LDI r5, 0x410A
  LDI r9, 15
  STORE r5, r9
  LDI r5, 0x410B
  LDI r9, 0
  STORE r5, r9
  ; rot3: rows = 2,2,2,2 (..X. = 0010 = 2)
  LDI r5, 0x410C
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x410D
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x410E
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x410F
  LDI r9, 2
  STORE r5, r9

  ; Piece 1 (O)
  ; all rotations: 6,6,0,0 (.XX. = 0110 = 6)
  LDI r3, 0x4140
ip_o_loop:
  LDI r9, 6
  STORE r3, r9
  LDI r12, 1
  ADD r3, r12
  LDI r9, 6
  STORE r3, r9
  LDI r12, 1
  ADD r3, r12
  LDI r9, 0
  STORE r3, r9
  LDI r12, 1
  ADD r3, r12
  LDI r9, 0
  STORE r3, r9
  LDI r12, 1
  ADD r3, r12
  LDI r4, 0x4160
  CMP r3, r4
  BLT r8, ip_o_loop

  ; Piece 2 (T)
  ; rot0: 2,7,0,0 (.X. XXX .... ....)
  LDI r5, 0x4180
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x4181
  LDI r9, 7
  STORE r5, r9
  LDI r5, 0x4282
  LDI r9, 0
  STORE r5, r9
  LDI r5, 0x4283
  LDI r9, 0
  STORE r5, r9
  ; rot1: 2,3,2,0 (.X. .XX .X. ....)
  LDI r5, 0x4284
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x4285
  LDI r9, 3
  STORE r5, r9
  LDI r5, 0x4286
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x4287
  LDI r9, 0
  STORE r5, r9
  ; rot2: 0,7,2,0 (.... XXX .X. ....)
  LDI r5, 0x4288
  LDI r9, 0
  STORE r5, r9
  LDI r5, 0x4289
  LDI r9, 7
  STORE r5, r9
  LDI r5, 0x428A
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x428B
  LDI r9, 0
  STORE r5, r9
  ; rot3: 2,6,2,0 (X.. .XX .X. ....)
  LDI r5, 0x428C
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x428D
  LDI r9, 6
  STORE r5, r9
  LDI r5, 0x428E
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x428F
  LDI r9, 0
  STORE r5, r9

  ; Piece 3 (S)
  ; rot0: 3,3,0,0  (..XX .XX. .... ....) -- wait let me recalculate
  ; .XX. = 0110 = 6, XX.. = 1100 = 12
  ; rot0: 6,3,0,0
  LDI r5, 0x41C0
  LDI r9, 6
  STORE r5, r9
  LDI r5, 0x41C1
  LDI r9, 3
  STORE r5, r9
  LDI r5, 0x41C2
  LDI r9, 0
  STORE r5, r9
  LDI r5, 0x41C3
  LDI r9, 0
  STORE r5, r9
  ; rot1: 2,3,1,0  (.X. .XX ..X. ....)
  LDI r5, 0x41C4
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x41C5
  LDI r9, 3
  STORE r5, r9
  LDI r5, 0x41C6
  LDI r9, 1
  STORE r5, r9
  LDI r5, 0x41C7
  LDI r9, 0
  STORE r5, r9
  ; rot2: 0,6,3,0  (.... .XX. ..XX ....)
  LDI r5, 0x41C8
  LDI r9, 0
  STORE r5, r9
  LDI r5, 0x41C9
  LDI r9, 6
  STORE r5, r9
  LDI r5, 0x41CA
  LDI r9, 3
  STORE r5, r9
  LDI r5, 0x41CB
  LDI r9, 0
  STORE r5, r9
  ; rot3: 2,6,4,0  (X.. .XX XX.. ....)
  LDI r5, 0x41CC
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x41CD
  LDI r9, 6
  STORE r5, r9
  LDI r5, 0x41CE
  LDI r9, 4
  STORE r5, r9
  LDI r5, 0x41CF
  LDI r9, 0
  STORE r5, r9

  ; Piece 4 (Z)
  ; rot0: 3,6,0,0  (..XX .XX. .... ....)
  LDI r5, 0x4300
  LDI r9, 3
  STORE r5, r9
  LDI r5, 0x4301
  LDI r9, 6
  STORE r5, r9
  LDI r5, 0x4302
  LDI r9, 0
  STORE r5, r9
  LDI r5, 0x4303
  LDI r9, 0
  STORE r5, r9
  ; rot1: 1,3,2,0  (..X. .XX. .X.. ....)
  LDI r5, 0x4304
  LDI r9, 1
  STORE r5, r9
  LDI r5, 0x4305
  LDI r9, 3
  STORE r5, r9
  LDI r5, 0x4306
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x4307
  LDI r9, 0
  STORE r5, r9
  ; rot2: 0,3,6,0  (.... ..XX .XX. ....)
  LDI r5, 0x4308
  LDI r9, 0
  STORE r5, r9
  LDI r5, 0x4309
  LDI r9, 3
  STORE r5, r9
  LDI r5, 0x430A
  LDI r9, 6
  STORE r5, r9
  LDI r5, 0x430B
  LDI r9, 0
  STORE r5, r9
  ; rot3: 4,6,2,0  (XX.. .XX. .X.. ....)
  LDI r5, 0x420C
  LDI r9, 4
  STORE r5, r9
  LDI r5, 0x420D
  LDI r9, 6
  STORE r5, r9
  LDI r5, 0x420E
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x420F
  LDI r9, 0
  STORE r5, r9

  ; Piece 5 (L)
  ; rot0: 1,1,3,0  (X.. X.. .XX. ....)
  LDI r5, 0x4240
  LDI r9, 1
  STORE r5, r9
  LDI r5, 0x4241
  LDI r9, 1
  STORE r5, r9
  LDI r5, 0x4242
  LDI r9, 3
  STORE r5, r9
  LDI r5, 0x4243
  LDI r9, 0
  STORE r5, r9
  ; rot1: 2,2,6,0  (.X. .X. .XX. ....)
  LDI r5, 0x4244
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x4245
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x4246
  LDI r9, 6
  STORE r5, r9
  LDI r5, 0x4247
  LDI r9, 0
  STORE r5, r9
  ; rot2: 0,7,4,0  (.... XXX. XX.. ....)
  LDI r5, 0x4248
  LDI r9, 0
  STORE r5, r9
  LDI r5, 0x4249
  LDI r9, 7
  STORE r5, r9
  LDI r5, 0x424A
  LDI r9, 4
  STORE r5, r9
  LDI r5, 0x424B
  LDI r9, 0
  STORE r5, r9
  ; rot3: 2,6,2,0  (.X. .XX. .X. ....)
  LDI r5, 0x424C
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x424D
  LDI r9, 6
  STORE r5, r9
  LDI r5, 0x424E
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x424F
  LDI r9, 0
  STORE r5, r9

  ; Piece 6 (J)
  ; rot0: 4,4,6,0  (XX.. XX.. .XX. ....)
  LDI r5, 0x4280
  LDI r9, 4
  STORE r5, r9
  LDI r5, 0x4281
  LDI r9, 4
  STORE r5, r9
  LDI r5, 0x4182
  LDI r9, 6
  STORE r5, r9
  LDI r5, 0x4183
  LDI r9, 0
  STORE r5, r9
  ; rot1: 6,2,2,0  (.XX. .X.. .X.. ....)
  LDI r5, 0x4184
  LDI r9, 6
  STORE r5, r9
  LDI r5, 0x4185
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x4186
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x4187
  LDI r9, 0
  STORE r5, r9
  ; rot2: 0,7,1,0  (.... .XXX ..X. ....)
  LDI r5, 0x4188
  LDI r9, 0
  STORE r5, r9
  LDI r5, 0x4189
  LDI r9, 7
  STORE r5, r9
  LDI r5, 0x418A
  LDI r9, 1
  STORE r5, r9
  LDI r5, 0x418B
  LDI r9, 0
  STORE r5, r9
  ; rot3: 2,6,4,0  (.X. .XX. XX.. ....)
  LDI r5, 0x418C
  LDI r9, 2
  STORE r5, r9
  LDI r5, 0x418D
  LDI r9, 6
  STORE r5, r9
  LDI r5, 0x418E
  LDI r9, 4
  STORE r5, r9
  LDI r5, 0x418F
  LDI r9, 0
  STORE r5, r9

  RET

; ── Piece colors (stored at 0x42C0, one per piece) ────────────────
; 0=I cyan, 1=O yellow, 2=T purple, 3=S green, 4=Z red, 5=L orange, 6=J blue
init_colors:
  LDI r5, 0x42C0
  LDI r9, 0x00CCCC     ; I - cyan
  STORE r5, r9
  LDI r5, 0x42C1
  LDI r9, 0xCCCC00     ; O - yellow
  STORE r5, r9
  LDI r5, 0x42C2
  LDI r9, 0xAA00CC     ; T - purple
  STORE r5, r9
  LDI r5, 0x42C3
  LDI r9, 0x00CC44     ; S - green
  STORE r5, r9
  LDI r5, 0x42C4
  LDI r9, 0xCC2200     ; Z - red
  STORE r5, r9
  LDI r5, 0x42C5
  LDI r9, 0xFF8800     ; L - orange
  STORE r5, r9
  LDI r5, 0x42C6
  LDI r9, 0x2244CC     ; J - blue
  STORE r5, r9
  RET

; ── init / restart ─────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r5, 0x40D6
  LOAD r9, r5
  JNZ r9, game_over_screen

  ; read keyboard
  IKEY r14

  ; A/a = move left
  LDI r4, 65
  CMP r14, r4
  JZ r8, do_left
  LDI r4, 97
  CMP r14, r4
  JZ r8, do_left

  ; D/d = move right
  LDI r4, 68
  CMP r14, r4
  JZ r8, do_right
  LDI r4, 100
  CMP r14, r4
  JZ r8, do_right

  ; W/w = rotate
  LDI r4, 87
  CMP r14, r4
  JZ r8, do_rotate
  LDI r4, 119
  CMP r14, r4
  JZ r8, do_rotate

  ; S/s = soft drop
  LDI r4, 83
  CMP r14, r4
  JZ r8, do_soft_drop
  LDI r4, 115
  CMP r14, r4
  JZ r8, do_soft_drop

  ; Space = hard drop
  LDI r4, 32
  CMP r14, r4
  JZ r8, do_hard_drop

  ; R/r = restart
  LDI r4, 82
  CMP r14, r4
  JZ r8, restart
  LDI r4, 114
  CMP r14, r4
  JZ r8, restart

after_input:
  ; auto-drop: check tick counter
  ; Normal speed: drop every 15 frames. Soft drop: every 3 frames.
  LDI r5, 0x40D9
  LOAD r9, r5           ; drop_counter
  LDI r12, 1
  ADD r9, r12
  LDI r5, 0x40D9
  STORE r5, r9

  ; check threshold
  LDI r5, 0x40D8
  LOAD r15, r5           ; soft_drop flag
  JNZ r15, soft_thresh
  
  ; normal threshold based on level: max(2, 15 - level)
  LDI r5, 0x40DA
  LOAD r11, r5           ; r11 = level
  LDI r4, 15
  SUB r4, r11            ; r4 = 15 - level
  
  ; clamp at 2
  LDI r14, 2
  CMP r4, r14
  BGE r8, speed_ok
  LDI r4, 2
speed_ok:
  LDI r5, 0x40D9
  LOAD r9, r5
  CMP r9, r4
  BLT r8, no_drop
  JMP do_drop
soft_thresh:
  LDI r5, 0x40D9
  LOAD r9, r5
  LDI r4, 3
  CMP r9, r4
  BLT r8, no_drop
do_drop:
  LDI r9, 0
  LDI r5, 0x40D9
  STORE r5, r9           ; reset counter
  CALL try_move_down
  JMP draw_and_loop
no_drop:
  JMP draw_and_loop

; ── input handlers ─────────────────────────────────────────────────
do_left:
  PUSH r31
  LDI r5, 0x40D1
  LOAD r9, r5           ; piece_x
  LDI r12, 1
  SUB r9, r12
  ; try at new position
  LDI r5, 0x40D1
  STORE r5, r9
  CALL check_collision
  JNZ r9, left_ok       ; no collision, keep move
  ; collision: revert
  LDI r5, 0x40D1
  LOAD r9, r5
  LDI r12, 1
  ADD r9, r12
  LDI r5, 0x40D1
  STORE r5, r9
left_ok:
  ; move sound
  LDI r12, 440
  LDI r4, 20
  BEEP r12, r4
  POP r31
  JMP after_input

do_right:
  PUSH r31
  LDI r5, 0x40D1
  LOAD r9, r5
  LDI r12, 1
  ADD r9, r12
  LDI r5, 0x40D1
  STORE r5, r9
  CALL check_collision
  JNZ r9, right_ok
  ; revert
  LDI r5, 0x40D1
  LOAD r9, r5
  LDI r12, 1
  SUB r9, r12
  LDI r5, 0x40D1
  STORE r5, r9
right_ok:
  ; move sound
  LDI r12, 440
  LDI r4, 20
  BEEP r12, r4
  POP r31
  JMP after_input

do_rotate:
  PUSH r31
  LDI r5, 0x40D3
  LOAD r9, r5           ; piece_rot
  LDI r12, 1
  ADD r9, r12
  LDI r4, 4
  MOD r9, r4
  LDI r5, 0x40D3
  STORE r5, r9
  CALL check_collision
  JNZ r9, rot_ok
  ; revert rotation
  LDI r5, 0x40D3
  LOAD r9, r5
  LDI r12, 3
  ADD r9, r12
  LDI r4, 4
  MOD r9, r4
  LDI r5, 0x40D3
  STORE r5, r9
rot_ok:
  ; rotate sound
  LDI r12, 660
  LDI r4, 20
  BEEP r12, r4
  POP r31
  JMP after_input

do_soft_drop:
  LDI r9, 1
  LDI r5, 0x40D8
  STORE r5, r9
  JMP after_input

do_hard_drop:
  PUSH r31
  ; hard drop sound (start)
  LDI r12, 440
  LDI r4, 50
  BEEP r12, r4
hd_loop:
  ; move down until collision
  LDI r5, 0x40D2
  LOAD r9, r5           ; piece_y
  LDI r12, 1
  ADD r9, r12
  LDI r5, 0x40D2
  STORE r5, r9
  CALL check_collision
  JZ r9, hd_done        ; collision detected, piece at final pos
  JMP hd_loop
hd_done:
  ; revert the last move (we moved into collision)
  LDI r5, 0x40D2
  LOAD r9, r5
  LDI r12, 1
  SUB r9, r12
  LDI r5, 0x40D2
  STORE r5, r9
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
  LDI r5, 0x40D2
  LOAD r9, r5           ; piece_y
  LDI r12, 1
  ADD r9, r12
  LDI r5, 0x40D2
  STORE r5, r9
  CALL check_collision
  JNZ r9, tmd_ok        ; no collision, piece moved down
  ; collision: revert and lock
  LDI r5, 0x40D2
  LOAD r9, r5
  LDI r12, 1
  SUB r9, r12
  LDI r5, 0x40D2
  STORE r5, r9
  CALL lock_piece
  CALL clear_lines
  CALL spawn_piece
tmd_ok:
  POP r31
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: check_collision
;   Returns r9 = 0 if collision, 1 if no collision
;   Checks current piece position against board and walls
; ─────────────────────────────────────────────────────────────────
check_collision:
  ; load piece info
  LDI r5, 0x40D0
  LOAD r3, r5          ; current_piece index
  LDI r5, 0x40D1
  LOAD r1, r5          ; piece_x
  LDI r5, 0x40D2
  LOAD r10, r5          ; piece_y
  LDI r5, 0x40D3
  LOAD r7, r5          ; piece_rot

  ; compute piece data address: 0x4100 + piece * 64 + rot * 16
  LDI r9, 0
  ADD r9, r3
  LDI r12, 64
  MUL r9, r12
  LDI r12, 0x4100
  ADD r9, r12
  LDI r12, 0
  ADD r12, r7
  LDI r4, 16
  MUL r12, r4
  ADD r9, r12            ; r9 = base address of rotation data

  LDI r13, 0            ; row counter (0-3)
cc_row:
  ; load row bitmap
  LDI r5, 0
  ADD r5, r9
  ADD r5, r13
  LOAD r0, r5          ; r0 = row bitmap

  LDI r16, 0            ; col counter (0-3)
cc_col:
  ; check bit 3-col (MSB = leftmost in 4-bit field)
  ; we want bit at position (3 - col)
  LDI r5, 3
  LDI r12, 0
  ADD r12, r16
  SUB r5, r12            ; r5 = 3 - col
  ; shift right by r5, AND with 1
  LDI r12, 0
  ADD r12, r0
  LDI r4, 0
  ADD r4, r5
  SHR r12, r4            ; r12 = bitmap >> (3-col)
  LDI r4, 1
  AND r12, r4            ; r12 = bit

  JZ r12, cc_next        ; empty cell, skip

  ; check bounds
  ; board col = piece_x + col, must be 0..9
  LDI r5, 0
  ADD r5, r1
  ADD r5, r16           ; board col
  LDI r4, 0
  CMP r5, r4
  BLT r8, cc_collision
  LDI r4, 10
  CMP r5, r4
  BGE r8, cc_collision

  ; board row = piece_y + row, must be 0..19
  LDI r5, 0
  ADD r5, r10
  ADD r5, r13           ; board row
  LDI r4, 20
  CMP r5, r4
  BGE r8, cc_collision
  ; row < 0 (unsigned underflow) -- let it go (piece above board is ok)

  ; check board cell (only if row < 20)
  LDI r5, 0
  ADD r5, r10
  ADD r5, r13
  LDI r4, 20
  CMP r5, r4
  BGE r8, cc_next       ; above board, ok
  ; board[row * 10 + col]
  LDI r12, 0
  ADD r12, r10
  ADD r12, r13
  LDI r4, 10
  MUL r12, r4
  LDI r4, 0
  ADD r4, r1
  ADD r4, r16
  ADD r12, r4            ; board index
  LDI r5, 0x4000
  ADD r5, r12
  LOAD r12, r5           ; board cell
  JNZ r12, cc_collision  ; occupied = collision

cc_next:
  LDI r12, 1
  ADD r16, r12
  LDI r4, 4
  CMP r16, r4
  BLT r8, cc_col

  LDI r12, 1
  ADD r13, r12
  LDI r4, 4
  CMP r13, r4
  BLT r8, cc_row

  ; no collision
  LDI r9, 1
  RET

cc_collision:
  LDI r9, 0
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: lock_piece -- write piece into board
; ─────────────────────────────────────────────────────────────────
lock_piece:
  LDI r5, 0x40D0
  LOAD r3, r5          ; piece index
  LDI r5, 0x40D1
  LOAD r1, r5          ; piece_x
  LDI r5, 0x40D2
  LOAD r10, r5          ; piece_y
  LDI r5, 0x40D3
  LOAD r7, r5          ; piece_rot

  ; get piece color
  LDI r5, 0x42C0
  ADD r5, r3
  LOAD r20, r5          ; r20 = color

  ; compute piece data address
  LDI r9, 0
  ADD r9, r3
  LDI r12, 64
  MUL r9, r12
  LDI r12, 0x4100
  ADD r9, r12
  LDI r12, 0
  ADD r12, r7
  LDI r4, 16
  MUL r12, r4
  ADD r9, r12

  LDI r13, 0
lp_row:
  LDI r5, 0
  ADD r5, r9
  ADD r5, r13
  LOAD r0, r5

  LDI r16, 0
lp_col:
  ; extract bit
  LDI r5, 3
  LDI r12, 0
  ADD r12, r16
  SUB r5, r12
  LDI r12, 0
  ADD r12, r0
  LDI r4, 0
  ADD r4, r5
  SHR r12, r4
  LDI r4, 1
  AND r12, r4

  JZ r12, lp_next

  ; bounds check
  LDI r5, 0
  ADD r5, r10
  ADD r5, r13           ; row
  LDI r4, 20
  CMP r5, r4
  BGE r8, lp_next

  ; write color to board
  LDI r12, 0
  ADD r12, r10
  ADD r12, r13
  LDI r4, 10
  MUL r12, r4
  LDI r4, 0
  ADD r4, r1
  ADD r4, r16
  ADD r12, r4
  LDI r5, 0x4000
  ADD r5, r12
  STORE r5, r20

lp_next:
  LDI r12, 1
  ADD r16, r12
  LDI r4, 4
  CMP r16, r4
  BLT r8, lp_col

  LDI r12, 1
  ADD r13, r12
  LDI r4, 4
  CMP r13, r4
  BLT r8, lp_row

  ; lock sound
  LDI r12, 330
  LDI r4, 30
  BEEP r12, r4

  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: clear_lines -- scan for full rows and clear them
;   Updates score and lines_cleared
; ─────────────────────────────────────────────────────────────────
clear_lines:
  PUSH r31
  LDI r25, 0            ; lines cleared this turn

  ; scan from bottom row (row 19) to top (row 0)
  LDI r13, 19
cl_row:
  ; check if row is full
  LDI r16, 0
  LDI r0, 1             ; assume full

  ; check 10 cells
  LDI r3, 0
cl_check:
  LDI r12, 0
  ADD r12, r13
  LDI r4, 10
  MUL r12, r4
  ADD r12, r3
  LDI r5, 0x4000
  ADD r5, r12
  LOAD r9, r5
  JZ r9, cl_not_full     ; empty cell = not full
  LDI r12, 1
  ADD r3, r12
  LDI r4, 10
  CMP r3, r4
  BLT r8, cl_check
  ; all 10 cells occupied = full row
  JMP cl_do_clear

cl_not_full:
  LDI r12, 1
  SUB r13, r12
  LDI r4, 0
  ; use BLT with signed comparison: if row < 0, unsigned wraps, but
  ; we compare with 0 as unsigned. If r13 was 0 and we subtract 1,
  ; it becomes 0xFFFFFFFF which is >= 0. So we need a different approach.
  ; Use CMP: if r13 < 0 (as signed), CMP with 0 would show BLT.
  ; But we use unsigned CMP. Let's just check if r13 > 19 or == 0xFFFFFFFF.
  ; Actually: CMP r13, r4 where r4=0 and using BLT: unsigned 0xFFFFFFFF > 0,
  ; so BLT won't trigger. We need a different sentinel.
  ; Fix: check if r13 < 0 by checking if r13 >= 0x80000000 (sign bit set)
  LDI r4, 0x80000000
  CMP r13, r4
  BGE r8, cl_done        ; sign bit set = underflow = done
  JMP cl_row

cl_do_clear:
  ; shift all rows above this one down by 1
  ; row r13 is full: copy row r13-1 to r13, r13-2 to r13-1, etc.
  LDI r0, 0             ; src row = r13 - 1
  LDI r12, 1
  SUB r0, r13
  LDI r12, 1
  ; wait, r0 = r13, then subtract 1
  LDI r0, 0
  ADD r0, r13

cl_shift:
  ; src_row = r0 - 1
  LDI r12, 0
  ADD r12, r0
  LDI r4, 1
  SUB r12, r4            ; r12 = src_row = r0 - 1
  ; if src_row < 0 (sign bit), we're at top, clear row 0 and stop
  LDI r4, 0x80000000
  CMP r12, r4
  BGE r8, cl_clear_top

  ; copy src_row to r0
  LDI r3, 0
cl_copy:
  ; src: board[src_row * 10 + col]
  LDI r5, 0
  ADD r5, r12
  LDI r4, 10
  MUL r5, r4
  ADD r5, r3
  LDI r14, 0x4000
  ADD r14, r5
  LOAD r9, r14           ; src cell

  ; dst: board[r0 * 10 + col]
  LDI r5, 0
  ADD r5, r0
  LDI r4, 10
  MUL r5, r4
  ADD r5, r3
  LDI r14, 0x4000
  ADD r14, r5
  STORE r14, r9          ; dst cell

  LDI r4, 1
  ADD r3, r4
  LDI r14, 10
  CMP r3, r14
  BLT r8, cl_copy

  LDI r4, 1
  SUB r0, r4
  ; check if r0 went below 0
  LDI r4, 0x80000000
  CMP r0, r4
  BGE r8, cl_clear_top
  JMP cl_shift

cl_clear_top:
  ; clear row 0
  LDI r3, 0
cl_clr:
  LDI r5, 0x4000
  ADD r5, r3
  LDI r9, 0
  STORE r5, r9
  LDI r12, 1
  ADD r3, r12
  LDI r4, 10
  CMP r3, r4
  BLT r8, cl_clr

  ; increment lines cleared this turn
  LDI r12, 1
  ADD r25, r12

  ; continue scanning from same row (shifted rows might also be full)
  JMP cl_row

cl_done:
  ; r25 = lines cleared this turn
  JZ r25, cl_ret
  
  ; Update score based on r25
  LDI r5, 0x40D4
  LOAD r9, r5           ; r9 = current score
  
  LDI r4, 1
  CMP r25, r4
  JZ r8, score_1
  
  LDI r4, 2
  CMP r25, r4
  JZ r8, score_2
  
  LDI r4, 3
  CMP r25, r4
  JZ r8, score_3
  
  ; 4 lines (Tetris)
  LDI r12, 800
  ADD r9, r12
  JMP score_stored

score_1:
  LDI r12, 100
  ADD r9, r12
  JMP score_stored
score_2:
  LDI r12, 300
  ADD r9, r12
  JMP score_stored
score_3:
  LDI r12, 500
  ADD r9, r12

score_stored:
  LDI r5, 0x40D4
  STORE r5, r9
  
  ; Clear sound
  LDI r12, 880
  LDI r4, 100
  BEEP r12, r4

  ; Update total lines_cleared
  LDI r5, 0x40D5
  LOAD r9, r5
  ADD r9, r25
  LDI r5, 0x40D5
  STORE r5, r9
  
  ; Update level = total_lines / 10
  LDI r15, 0
  ADD r15, r9
  LDI r11, 10
  DIV r15, r11
  LDI r5, 0x40DA
  STORE r5, r15

cl_ret:
  POP r31
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: spawn_piece -- next piece becomes current, pick new next
; ─────────────────────────────────────────────────────────────────
spawn_piece:
  PUSH r31
  ; copy next_piece to current_piece
  LDI r5, 0x40D7
  LOAD r9, r5
  LDI r5, 0x40D0
  STORE r5, r9           ; current_piece = next_piece

  ; pick new next_piece
  RAND r9
  LDI r15, 7
  MOD r9, r15
  LDI r5, 0x40D7
  STORE r5, r9

  ; reset piece state
  LDI r9, 3             ; start at column 3 (centered)
  LDI r5, 0x40D1
  STORE r5, r9           ; piece_x = 3
  LDI r9, 0
  LDI r5, 0x40D2
  STORE r5, r9           ; piece_y = 0 (top)
  LDI r9, 0
  LDI r5, 0x40D3
  STORE r5, r9           ; piece_rot = 0
  LDI r9, 0
  LDI r5, 0x40D9
  STORE r5, r9           ; drop_counter = 0

  ; check if new piece collides immediately = game over
  CALL check_collision
  JNZ r9, sp_ok
  ; collision at spawn = game over
  LDI r9, 1
  LDI r5, 0x40D6
  STORE r5, r9
  ; game over sound
  LDI r12, 110
  LDI r4, 300
  BEEP r12, r4
sp_ok:
  POP r31
  RET

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r9, 0x220000
  FILL r9
  FRAME
  IKEY r14
  JZ r14, game_over_screen
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
  LDI r9, 0x000811
  FILL r9

  ; draw board cells
  LDI r13, 0            ; row
df_brow:
  LDI r16, 0            ; col
df_bcol:
  ; board[row * 10 + col]
  LDI r12, 0
  ADD r12, r13
  LDI r4, 10
  MUL r12, r4
  ADD r12, r16
  LDI r5, 0x4000
  ADD r5, r12
  LOAD r20, r5          ; cell color (0=empty)

  JZ r20, df_bskip

  ; pixel x = 10 + col * 12
  LDI r12, 0
  ADD r12, r16
  LDI r4, 12
  MUL r12, r4
  LDI r4, 10
  ADD r12, r4            ; px_x

  ; pixel y = 8 + row * 12
  LDI r4, 0
  ADD r4, r13
  LDI r14, 12
  MUL r4, r14
  LDI r14, 8
  ADD r4, r14            ; px_y

  LDI r21, 11           ; width (12-1 for 1px gap)
  LDI r22, 11           ; height
  RECTF r12, r4, r21, r22, r20

df_bskip:
  LDI r12, 1
  ADD r16, r12
  LDI r4, 10
  CMP r16, r4
  BLT r8, df_bcol

  LDI r12, 1
  ADD r13, r12
  LDI r4, 20
  CMP r13, r4
  BLT r8, df_brow

  ; draw current piece
  PUSH r31
  CALL draw_piece
  POP r31

  ; draw board border
  ; left edge: x=9, y=8, w=1, h=240
  LDI r12, 9
  LDI r4, 8
  LDI r14, 1
  LDI r2, 240
  LDI r6, 0x555555
  RECTF r12, r4, r14, r2, r6
  ; right edge: x=130, y=8, w=1, h=240
  LDI r12, 130
  RECTF r12, r4, r14, r2, r6
  ; bottom edge: x=9, y=248, w=122, h=1
  LDI r12, 9
  LDI r4, 248
  LDI r14, 122
  LDI r2, 1
  RECTF r12, r4, r14, r2, r6

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
  LDI r5, 0x40D6
  LOAD r9, r5
  JNZ r9, dp_ret         ; game over, don't draw piece

  LDI r5, 0x40D0
  LOAD r3, r5
  LDI r5, 0x40D1
  LOAD r1, r5
  LDI r5, 0x40D2
  LOAD r10, r5
  LDI r5, 0x40D3
  LOAD r7, r5

  ; get color
  LDI r5, 0x42C0
  ADD r5, r3
  LOAD r20, r5

  ; compute data address
  LDI r9, 0
  ADD r9, r3
  LDI r12, 64
  MUL r9, r12
  LDI r12, 0x4100
  ADD r9, r12
  LDI r12, 0
  ADD r12, r7
  LDI r4, 16
  MUL r12, r4
  ADD r9, r12

  LDI r13, 0
dp_row:
  LDI r5, 0
  ADD r5, r9
  ADD r5, r13
  LOAD r0, r5

  LDI r16, 0
dp_col:
  ; extract bit
  LDI r5, 3
  LDI r12, 0
  ADD r12, r16
  SUB r5, r12
  LDI r12, 0
  ADD r12, r0
  LDI r4, 0
  ADD r4, r5
  SHR r12, r4
  LDI r4, 1
  AND r12, r4

  JZ r12, dp_next

  ; only draw if on screen (row >= 0)
  LDI r5, 0
  ADD r5, r10
  ADD r5, r13           ; board row
  LDI r4, 20
  CMP r5, r4
  BGE r8, dp_next

  ; pixel coords
  LDI r12, 0
  ADD r12, r1
  ADD r12, r16
  LDI r4, 12
  MUL r12, r4
  LDI r4, 10
  ADD r12, r4            ; px_x

  LDI r4, 0
  ADD r4, r10
  ADD r4, r13
  LDI r14, 12
  MUL r4, r14
  LDI r14, 8
  ADD r4, r14            ; px_y

  LDI r21, 11
  LDI r22, 11
  RECTF r12, r4, r21, r22, r20

dp_next:
  LDI r12, 1
  ADD r16, r12
  LDI r4, 4
  CMP r16, r4
  BLT r8, dp_col

  LDI r12, 1
  ADD r13, r12
  LDI r4, 4
  CMP r13, r4
  BLT r8, dp_row

dp_ret:
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_score -- display score on right panel
; ─────────────────────────────────────────────────────────────────
draw_score:
  ; score text "SCORE:" at 0x4200..0x4205
  LDI r5, 0x4300
  LDI r9, 83
  STORE r5, r9
  LDI r5, 0x4301
  LDI r9, 67
  STORE r5, r9
  LDI r5, 0x4302
  LDI r9, 79
  STORE r5, r9
  LDI r5, 0x4303
  LDI r9, 82
  STORE r5, r9
  LDI r5, 0x4304
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x4305
  LDI r9, 58
  STORE r5, r9

  ; convert score to 5 digits
  LDI r5, 0x40D4
  LOAD r9, r5           ; score

  ; ten-thousands
  LDI r15, 0
  ADD r15, r9
  LDI r11, 10000
  DIV r15, r11
  LDI r12, 48
  ADD r15, r12
  LDI r5, 0x4306
  STORE r5, r15

  ; thousands
  LDI r15, 0
  ADD r15, r9
  LDI r11, 10000
  LDI r4, 0
  ADD r4, r5
  LOAD r4, r4
  LDI r12, 48
  SUB r4, r12
  MUL r4, r11
  SUB r15, r4
  LDI r11, 1000
  DIV r15, r11
  LDI r12, 48
  ADD r15, r12
  LDI r5, 0x4307
  STORE r5, r15

  ; hundreds
  LDI r15, 0
  ADD r15, r9
  LDI r11, 10000
  LDI r4, 0
  ADD r4, r5
  LOAD r4, r4
  LDI r12, 48
  SUB r4, r12
  MUL r4, r11
  LDI r5, 0x4307
  LOAD r14, r5
  LDI r12, 48
  SUB r14, r12
  LDI r11, 1000
  MUL r14, r11
  ADD r4, r14
  SUB r15, r4
  LDI r11, 100
  DIV r15, r11
  LDI r12, 48
  ADD r15, r12
  LDI r5, 0x4308
  STORE r5, r15

  ; tens
  LDI r15, 0
  ADD r15, r9
  ; subtract (10000*tth + 1000*th + 100*h)
  ; simpler: score mod 100 / 10
  LDI r11, 100
  MOD r15, r11
  LDI r11, 10
  DIV r15, r11
  LDI r12, 48
  ADD r15, r12
  LDI r5, 0x4309
  STORE r5, r15

  ; ones
  LDI r15, 0
  ADD r15, r9
  LDI r11, 10
  MOD r15, r11
  LDI r12, 48
  ADD r15, r12
  LDI r5, 0x430A
  STORE r5, r15

  ; null terminator
  LDI r9, 0
  LDI r5, 0x430B
  STORE r5, r9

  ; render
  LDI r12, 138
  LDI r4, 10
  LDI r14, 0x4300
  TEXT r12, r4, r14

  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_lines -- display lines cleared count
; ─────────────────────────────────────────────────────────────────
draw_lines:
  ; "LINES:" at 0x4210..0x4215
  LDI r5, 0x4310
  LDI r9, 76
  STORE r5, r9
  LDI r5, 0x4311
  LDI r9, 73
  STORE r5, r9
  LDI r5, 0x4312
  LDI r9, 78
  STORE r5, r9
  LDI r5, 0x4313
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x4314
  LDI r9, 83
  STORE r5, r9
  LDI r5, 0x4315
  LDI r9, 58
  STORE r5, r9

  ; lines count (max 999)
  LDI r5, 0x40D5
  LOAD r9, r5

  ; hundreds
  LDI r15, 0
  ADD r15, r9
  LDI r11, 100
  DIV r15, r11
  LDI r12, 48
  ADD r15, r12
  LDI r5, 0x4316
  STORE r5, r15

  ; tens
  LDI r15, 0
  ADD r15, r9
  LDI r11, 100
  MOD r15, r11
  LDI r11, 10
  DIV r15, r11
  LDI r12, 48
  ADD r15, r12
  LDI r5, 0x4317
  STORE r5, r15

  ; ones
  LDI r15, 0
  ADD r15, r9
  LDI r11, 10
  MOD r15, r11
  LDI r12, 48
  ADD r15, r12
  LDI r5, 0x4318
  STORE r5, r15

  ; null terminator
  LDI r9, 0
  LDI r5, 0x4319
  STORE r5, r9

  LDI r12, 138
  LDI r4, 26
  LDI r14, 0x4310
  TEXT r12, r4, r14

  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_next -- preview next piece
; ─────────────────────────────────────────────────────────────────
draw_next:
  ; "NEXT:" label
  LDI r5, 0x4320
  LDI r9, 78
  STORE r5, r9
  LDI r5, 0x4321
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x4322
  LDI r9, 88
  STORE r5, r9
  LDI r5, 0x4323
  LDI r9, 84
  STORE r5, r9
  LDI r5, 0x4324
  LDI r9, 58
  STORE r5, r9

  LDI r12, 138
  LDI r4, 50
  LDI r14, 0x4320
  TEXT r12, r4, r14

  ; draw the next piece in preview area
  LDI r5, 0x40D7
  LOAD r3, r5          ; next piece index

  ; get color
  LDI r5, 0x42C0
  ADD r5, r3
  LOAD r20, r5

  ; draw rotation 0
  LDI r9, 0
  ADD r9, r3
  LDI r12, 64
  MUL r9, r12
  LDI r12, 0x4100
  ADD r9, r12            ; r9 = base address

  LDI r13, 0
dn_row:
  LDI r5, 0
  ADD r5, r9
  ADD r5, r13
  LOAD r0, r5

  LDI r16, 0
dn_col:
  LDI r5, 3
  LDI r12, 0
  ADD r12, r16
  SUB r5, r12
  LDI r12, 0
  ADD r12, r0
  LDI r4, 0
  ADD r4, r5
  SHR r12, r4
  LDI r4, 1
  AND r12, r4

  JZ r12, dn_next

  ; preview at x=148, y=66, 8px per cell
  LDI r12, 0
  ADD r12, r16
  LDI r4, 8
  MUL r12, r4
  LDI r4, 148
  ADD r12, r4

  LDI r4, 0
  ADD r4, r13
  LDI r14, 8
  MUL r4, r14
  LDI r14, 66
  ADD r4, r14

  LDI r21, 7
  LDI r22, 7
  RECTF r12, r4, r21, r22, r20

dn_next:
  LDI r12, 1
  ADD r16, r12
  LDI r4, 4
  CMP r16, r4
  BLT r8, dn_col

  LDI r12, 1
  ADD r13, r12
  LDI r4, 4
  CMP r13, r4
  BLT r8, dn_row

  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_level -- display level
; ─────────────────────────────────────────────────────────────────
draw_level:
  ; "LEVEL:" at 0x4330..0x4335
  LDI r5, 0x4330
  LDI r9, 76
  STORE r5, r9 ; L
  LDI r5, 0x4331
  LDI r9, 69
  STORE r5, r9 ; E
  LDI r5, 0x4332
  LDI r9, 86
  STORE r5, r9 ; V
  LDI r5, 0x4333
  LDI r9, 69
  STORE r5, r9 ; E
  LDI r5, 0x4334
  LDI r9, 76
  STORE r5, r9 ; L
  LDI r5, 0x4335
  LDI r9, 58
  STORE r5, r9 ; :
  
  LDI r5, 0x40DA
  LOAD r9, r5 ; level
  
  ; tens
  LDI r15, 0
  ADD r15, r9
  LDI r11, 10
  DIV r15, r11
  LDI r12, 48
  ADD r15, r12
  LDI r5, 0x4336
  STORE r5, r15
  
  ; ones
  LDI r15, 0
  ADD r15, r9
  LDI r11, 10
  MOD r15, r11
  LDI r12, 48
  ADD r15, r12
  LDI r5, 0x4337
  STORE r5, r15
  
  ; null
  LDI r9, 0
  LDI r5, 0x4338
  STORE r5, r9
  
  ; render
  LDI r12, 138
  LDI r4, 50
  LDI r14, 0x4330
  TEXT r12, r4, r14
  RET
