; ═══════════════════════════════════════════════════════════
; TETRIS for Geometry OS
; Controls: A=left, D=right, W=rotate, S=soft drop, Space=hard drop
; ═══════════════════════════════════════════════════════════

; Memory: Board 0x4000 (200 cells), State 0x40D0, Rotations 0x4100
; Colors 0x42C0, Score table 0x42D0, Text 0x4320
; Screen: 256x256, board 100x200 at (78,28), cell=10px

restart:
  ; -- Constants --
  LDI r30, 0xFF00
  LDI r1, 1
  LDI r2, 10
  LDI r3, 20
  LDI r4, 0

  ; -- Clear board 200 cells at 0x4000 --
  LDI r10, 0x4000
  LDI r11, 200
clr_b:
  STORE r10, r4
  ADD r10, r1
  SUB r11, r1
  JNZ r11, clr_b

  ; -- store_4 helper: r20=addr, r21-r24=vals --
store_4:
  STORE r20, r21
  ADD r20, r1
  STORE r20, r22
  ADD r20, r1
  STORE r20, r23
  ADD r20, r1
  STORE r20, r24
  RET

  ; -- Rotation data at 0x4100 (7 pieces x 4 rots x 4 rows) --
  ; I-piece (type 0)
  LDI r20, 0x4100
  ; LDI r21, 0; LDI r22, 0; LDI r23, 15; LDI r24, 0; CALL store_4
    LDI r20, 0x4100
  LDI r20, 0x4104
  ; LDI r21, 4; LDI r22, 4; LDI r23, 4; LDI r24, 4; CALL store_4
    LDI r20, 0x4104
  LDI r20, 0x4108
  ; LDI r21, 0; LDI r22, 0; LDI r23, 15; LDI r24, 0; CALL store_4
    LDI r20, 0x4108
  LDI r20, 0x410C
  ; LDI r21, 4; LDI r22, 4; LDI r23, 4; LDI r24, 4; CALL store_4
    LDI r20, 0x410C
  ; O-piece (type 1)
  LDI r20, 0x4110
  ; LDI r21, 12; LDI r22, 12; LDI r23, 0; LDI r24, 0; CALL store_4
    LDI r20, 0x4110
  LDI r20, 0x4114
  ; LDI r21, 12; LDI r22, 12; LDI r23, 0; LDI r24, 0; CALL store_4
    LDI r20, 0x4114
  LDI r20, 0x4118
  ; LDI r21, 12; LDI r22, 12; LDI r23, 0; LDI r24, 0; CALL store_4
    LDI r20, 0x4118
  LDI r20, 0x411C
  ; LDI r21, 12; LDI r22, 12; LDI r23, 0; LDI r24, 0; CALL store_4
    LDI r20, 0x411C
  ; T-piece (type 2)
  LDI r20, 0x4120
  ; LDI r21, 4; LDI r22, 14; LDI r23, 0; LDI r24, 0; CALL store_4
    LDI r20, 0x4120
  LDI r20, 0x4124
  ; LDI r21, 4; LDI r22, 12; LDI r23, 4; LDI r24, 0; CALL store_4
    LDI r20, 0x4124
  LDI r20, 0x4128
  ; LDI r21, 0; LDI r22, 14; LDI r23, 4; LDI r24, 0; CALL store_4
    LDI r20, 0x4128
  LDI r20, 0x412C
  ; LDI r21, 4; LDI r22, 6; LDI r23, 4; LDI r24, 0; CALL store_4
    LDI r20, 0x412C
  ; S-piece (type 3)
  LDI r20, 0x4130
  ; LDI r21, 6; LDI r22, 12; LDI r23, 0; LDI r24, 0; CALL store_4
    LDI r20, 0x4130
  LDI r20, 0x4134
  ; LDI r21, 4; LDI r22, 6; LDI r23, 2; LDI r24, 0; CALL store_4
    LDI r20, 0x4134
  LDI r20, 0x4138
  ; LDI r21, 0; LDI r22, 6; LDI r23, 4; LDI r24, 0; CALL store_4
    LDI r20, 0x4138
  LDI r20, 0x413C
  ; LDI r21, 8; LDI r22, 12; LDI r23, 4; LDI r24, 0; CALL store_4
    LDI r20, 0x413C
  ; Z-piece (type 4)
  LDI r20, 0x4140
  ; LDI r21, 12; LDI r22, 6; LDI r23, 0; LDI r24, 0; CALL store_4
    LDI r20, 0x4140
  LDI r20, 0x4144
  ; LDI r21, 2; LDI r22, 6; LDI r23, 4; LDI r24, 0; CALL store_4
    LDI r20, 0x4144
  LDI r20, 0x4148
  ; LDI r21, 4; LDI r22, 12; LDI r23, 2; LDI r24, 0; CALL store_4
    LDI r20, 0x4148
  LDI r20, 0x414C
  ; LDI r21, 4; LDI r22, 6; LDI r23, 8; LDI r24, 0; CALL store_4
    LDI r20, 0x414C
  ; L-piece (type 5)
  LDI r20, 0x4150
  ; LDI r21, 8; LDI r22, 14; LDI r23, 0; LDI r24, 0; CALL store_4
    LDI r20, 0x4150
  LDI r20, 0x4154
  ; LDI r21, 6; LDI r22, 4; LDI r23, 4; LDI r24, 0; CALL store_4
    LDI r20, 0x4154
  LDI r20, 0x4158
  ; LDI r21, 14; LDI r22, 2; LDI r23, 0; LDI r24, 0; CALL store_4
    LDI r20, 0x4158
  LDI r20, 0x415C
  ; LDI r21, 4; LDI r22, 4; LDI r23, 12; LDI r24, 0; CALL store_4
    LDI r20, 0x415C
  ; J-piece (type 6)
  LDI r20, 0x4160
  ; LDI r21, 2; LDI r22, 14; LDI r23, 0; LDI r24, 0; CALL store_4
    LDI r20, 0x4160
  LDI r20, 0x4164
  ; LDI r21, 4; LDI r22, 4; LDI r23, 6; LDI r24, 0; CALL store_4
    LDI r20, 0x4164
  LDI r20, 0x4168
  ; LDI r21, 14; LDI r22, 8; LDI r23, 0; LDI r24, 0; CALL store_4
    LDI r20, 0x4168
  LDI r20, 0x416C
  ; LDI r21, 12; LDI r22, 4; LDI r23, 4; LDI r24, 0; CALL store_4
    LDI r20, 0x416C

  ; -- Piece colors at 0x42C0 --
  LDI r11, 0x42C0
  ; LDI r12, 0x00CCCC; STORE r11, r12
    LDI r11, 0x42C0
  LDI r11, 0x42C1
  ; LDI r12, 0xCCCC00; STORE r11, r12
    LDI r11, 0x42C1
  LDI r11, 0x42C2
  ; LDI r12, 0xAA00CC; STORE r11, r12
    LDI r11, 0x42C2
  LDI r11, 0x42C3
  ; LDI r12, 0x00CC44; STORE r11, r12
    LDI r11, 0x42C3
  LDI r11, 0x42C4
  ; LDI r12, 0xCC2200; STORE r11, r12
    LDI r11, 0x42C4
  LDI r11, 0x42C5
  ; LDI r12, 0xFF8800; STORE r11, r12
    LDI r11, 0x42C5
  LDI r11, 0x42C6
  ; LDI r12, 0x2244CC; STORE r11, r12
    LDI r11, 0x42C6

  ; -- Score table at 0x42D0: 0,100,300,500,800 --
  LDI r11, 0x42D0
  ; LDI r12, 0; STORE r11, r12
    LDI r11, 0x42D0
  LDI r11, 0x42D1
  ; LDI r12, 100; STORE r11, r12
    LDI r11, 0x42D1
  LDI r11, 0x42D2
  ; LDI r12, 300; STORE r11, r12
    LDI r11, 0x42D2
  LDI r11, 0x42D3
  ; LDI r12, 500; STORE r11, r12
    LDI r11, 0x42D3
  LDI r11, 0x42D4
  ; LDI r12, 800; STORE r11, r12
    LDI r11, 0x42D4

  ; -- Game state at 0x40D0 --
  LDI r11, 0x40D0
  ; LDI r12, 0; STORE r11, r12    ; current_piece
    LDI r11, 0x40D0
  LDI r11, 0x40D1
  ; LDI r12, 3; STORE r11, r12    ; piece_x
    LDI r11, 0x40D1
  LDI r11, 0x40D2
  ; LDI r12, 0; STORE r11, r12    ; piece_y
    LDI r11, 0x40D2
  LDI r11, 0x40D3
  ; LDI r12, 0; STORE r11, r12    ; piece_rot
    LDI r11, 0x40D3
  LDI r11, 0x40D4
  ; LDI r12, 0; STORE r11, r12    ; score
    LDI r11, 0x40D4
  LDI r11, 0x40D5
  ; LDI r12, 0; STORE r11, r12    ; lines_cleared
    LDI r11, 0x40D5
  LDI r11, 0x40D6
  ; LDI r12, 0; STORE r11, r12    ; game_over
    LDI r11, 0x40D6
  LDI r11, 0x40D7
  ; RAND r12; LDI r13, 7; MOD r12, r13; STORE r11, r12  ; next_piece
    LDI r11, 0x40D7
  LDI r11, 0x40D8
  ; LDI r12, 0; STORE r11, r12    ; soft_drop
    LDI r11, 0x40D8
  LDI r11, 0x40D9
  ; LDI r12, 0; STORE r11, r12    ; drop_timer
    LDI r11, 0x40D9
  LDI r11, 0x40DA
  ; LDI r12, 1; STORE r11, r12    ; level
    LDI r11, 0x40DA

  ; -- Text strings --
  LDI r19, 0x4320
  ; STRO r19, "NEXT"
    LDI r19, 0x4320
  LDI r19, 0x4325
  ; STRO r19, "SCORE"
    LDI r19, 0x4325
  LDI r19, 0x432B
  ; STRO r19, "LINES"
    LDI r19, 0x432B
  LDI r19, 0x4331
  ; STRO r19, "LEVEL"
    LDI r19, 0x4331
  LDI r19, 0x4337
  ; STRO r19, "GAME OVER"
    LDI r19, 0x4337

  ; -- Spawn first piece --
  CALL spawn_piece

  ; -- Draw initial frame --
  LDI r11, 0
  ; FILL r11
    LDI r11, 0
  CALL draw_border
  CALL draw_board_cells
  CALL draw_cur_piece
  CALL draw_preview
  CALL draw_hud
  FRAME

; ═════════════ GAME LOOP ═════════════
game_loop:
  LDI r11, 0x40D6
  ; LOAD r11, r11; JNZ r11, go_screen
    LDI r11, 0x40D6
  LDI r11, 0
  ; FILL r11
    LDI r11, 0
  CALL draw_border
  CALL draw_board_cells
  IKEY r10
  ; A=65: move left
  LDI r11, 65
  ; CMP r10, r11; JNZ r0, n_left; CALL try_left
    LDI r11, 65
n_left:
  ; D=68: move right
  LDI r11, 68
  ; CMP r10, r11; JNZ r0, n_right; CALL try_right
    LDI r11, 68
n_right:
  ; W=87: rotate
  LDI r11, 87
  ; CMP r10, r11; JNZ r0, n_rot; CALL try_rot
    LDI r11, 87
n_rot:
  ; S=83: soft drop
  LDI r11, 83
  ; CMP r10, r11; JNZ r0, n_sdrop; CALL try_sdrop
    LDI r11, 83
n_sdrop:
  ; Space=32: hard drop
  LDI r11, 32
  ; CMP r10, r11; JNZ r0, n_hdrop; CALL hard_drop
    LDI r11, 32
n_hdrop:
  CALL do_gravity
  CALL draw_cur_piece
  CALL draw_preview
  CALL draw_hud
  FRAME
  JMP game_loop

; ═════════════ GAME OVER SCREEN ═════════════
go_screen:
  LDI r11, 0
  ; FILL r11
    LDI r11, 0
  LDI r16, 88
  ; LDI r17, 100; LDI r18, 0x4337; TEXT r16, r17, r18
    LDI r16, 88
  LDI r16, 100
  ; LDI r17, 125; LDI r18, 0x4325; TEXT r16, r17, r18
    LDI r16, 100
  LDI r16, 0x40D4
  ; LOAD r20, r16; LDI r21, 0x4341; CALL int_to_str
    LDI r16, 0x40D4
  LDI r16, 100
  ; LDI r17, 137; LDI r18, 0x4341; TEXT r16, r17, r18
    LDI r16, 100
  FRAME
  IKEY r10
  ; JZ r10, go_screen
    IKEY r10
  JMP restart

; ═════════════ SUBROUTINES ═════════════

; --- check_collision ---
; Input: r20=piece_x, r21=piece_y, r22=piece_rot, r23=piece_type
; Output: r25 (0=ok, 1=collision)
check_collision:
  LDI r25, 0
  LDI r24, 0
cc_row:
  MOV r16, r23
  ; LDI r17, 16; MUL r16, r17
    MOV r16, r23
  MOV r17, r22
  ; LDI r18, 4; MUL r17, r18
    MOV r17, r22
  ADD r16, r17
  ; ADD r16, r24; LDI r17, 0x4100; ADD r16, r17
    ADD r16, r17
  LOAD r16, r16
  LDI r17, 0
cc_col:
  MOV r18, r17
  ; LDI r19, 8; SHR r19, r18
    MOV r18, r17
  MOV r18, r16
  ; AND r18, r19; JZ r18, cc_nxt
    MOV r18, r16
  ; bounds check x
  MOV r18, r20
  ; ADD r18, r17
    MOV r18, r20
  CMP r18, r2
  ; BGE r0, cc_hit
    CMP r18, r2
  ; bounds check y
  MOV r18, r21
  ; ADD r18, r24
    MOV r18, r21
  CMP r18, r3
  ; BGE r0, cc_hit
    CMP r18, r3
  ; board cell check
  LDI r18, 0x4000
  MOV r19, r21
  ; ADD r19, r24; LDI r26, 10; MUL r19, r26; ADD r18, r19
    MOV r19, r21
  MOV r19, r20
  ; ADD r19, r17; ADD r18, r19
    MOV r19, r20
  LOAD r18, r18
  ; JNZ r18, cc_hit
    LOAD r18, r18
cc_nxt:
  ADD r17, r1
  ; LDI r19, 4; CMP r17, r19; BLT r0, cc_col
    ADD r17, r1
  ADD r24, r1
  ; LDI r19, 4; CMP r24, r19; BLT r0, cc_row
    ADD r24, r1
  RET
cc_hit:
  LDI r25, 1
  ; RET
    LDI r25, 1

; --- lock_piece ---
lock_piece:
  PUSH r31
  LDI r20, 0x40D1
  ; LOAD r20, r20
    LDI r20, 0x40D1
  LDI r21, 0x40D2
  ; LOAD r21, r21
    LDI r21, 0x40D2
  LDI r22, 0x40D3
  ; LOAD r22, r22
    LDI r22, 0x40D3
  LDI r23, 0x40D0
  ; LOAD r23, r23
    LDI r23, 0x40D0
  LDI r16, 0x42C0
  ; ADD r16, r23; LOAD r16, r16
    LDI r16, 0x42C0
  LDI r24, 0
lp_row:
  MOV r17, r23
  ; LDI r18, 16; MUL r17, r18
    MOV r17, r23
  MOV r18, r22
  ; LDI r19, 4; MUL r18, r19
    MOV r18, r22
  ADD r17, r18
  ; ADD r17, r24; LDI r18, 0x4100; ADD r17, r18
    ADD r17, r18
  LOAD r17, r17
  LDI r18, 0
lp_col:
  MOV r19, r18
  ; LDI r26, 8; SHR r26, r19
    MOV r19, r18
  MOV r19, r17
  ; AND r19, r26; JZ r19, lp_nxt
    MOV r19, r17
  LDI r19, 0x4000
  MOV r26, r21
  ; ADD r26, r24; LDI r27, 10; MUL r26, r27; ADD r19, r26
    MOV r26, r21
  MOV r26, r20
  ; ADD r26, r18; ADD r19, r26
    MOV r26, r20
  STORE r19, r16
lp_nxt:
  ADD r18, r1
  ; LDI r19, 4; CMP r18, r19; BLT r0, lp_col
    ADD r18, r1
  ADD r24, r1
  ; LDI r19, 4; CMP r24, r19; BLT r0, lp_row
    ADD r24, r1
  POP r31
  ; RET
    POP r31

; --- clear_lines ---
; Returns r25 = number of lines cleared
clear_lines:
  PUSH r31
  LDI r25, 0
  LDI r16, 19
cl_row:
  LDI r17, 1
  ; LDI r18, 0
    LDI r17, 1
cl_chk:
  LDI r19, 0x4000
  MOV r26, r16
  ; LDI r27, 10; MUL r26, r27; ADD r19, r26; ADD r19, r18
    MOV r26, r16
  LOAD r19, r19
  ; JZ r19, cl_nf
    LOAD r19, r19
  ADD r18, r1
  ; CMP r18, r2; BLT r0, cl_chk
    ADD r18, r1
  ; row is full - shift above down
  ADD r25, r1
  MOV r26, r16
cl_sh:
  JZ r26, cl_shd
  LDI r18, 0
cl_cp:
  LDI r19, 0x4000
  MOV r27, r26
  ; SUB r27, r1; LDI r28, 10; MUL r27, r28; ADD r19, r27; ADD r19, r18
    MOV r27, r26
  LOAD r19, r19
  LDI r20, 0x4000
  MOV r27, r16
  ; LDI r28, 10; MUL r27, r28; ADD r20, r27; ADD r20, r18
    MOV r27, r16
  STORE r20, r19
  ADD r18, r1
  ; CMP r18, r2; BLT r0, cl_cp
    ADD r18, r1
  SUB r26, r1
  ; JMP cl_sh
    SUB r26, r1
cl_shd:
  ; clear top row
  LDI r18, 0
cl_top:
  LDI r19, 0x4000
  ; ADD r19, r18; STORE r19, r4
    LDI r19, 0x4000
  ADD r18, r1
  ; CMP r18, r2; BLT r0, cl_top
    ADD r18, r1
  JMP cl_row
cl_nf:
  SUB r16, r1
  LDI r19, 20
  ; CMP r16, r19; BGE r0, cl_done
    LDI r19, 20
  JMP cl_row
cl_done:
  POP r31
  ; RET
    POP r31

; --- update_score ---
; Input: r25 = lines cleared (0-4)
update_score:
  PUSH r31
  MOV r16, r25
  ; JZ r16, us_d
    MOV r16, r25
  ; add to total lines
  LDI r17, 0x40D5
  ; LOAD r18, r17; ADD r18, r16; STORE r17, r18
    LDI r17, 0x40D5
  ; score += score_table[lines] * level
  LDI r17, 0x42D0
  ; ADD r17, r16; LOAD r17, r17
    LDI r17, 0x42D0
  LDI r18, 0x40DA
  ; LOAD r18, r18; MUL r17, r18
    LDI r18, 0x40DA
  LDI r18, 0x40D4
  ; LOAD r19, r18; ADD r19, r17; STORE r18, r19
    LDI r18, 0x40D4
  ; level = total_lines/10 + 1
  LDI r17, 0x40D5
  ; LOAD r18, r17; LDI r19, 10; DIV r18, r19
    LDI r17, 0x40D5
  ADD r18, r1
  ; LDI r17, 0x40DA; STORE r17, r18
    ADD r18, r1
us_d:
  POP r31
  ; RET
    POP r31

; --- spawn_piece ---
spawn_piece:
  PUSH r31
  ; current_piece = next_piece
  LDI r16, 0x40D7
  ; LOAD r17, r16; LDI r16, 0x40D0; STORE r16, r17
    LDI r16, 0x40D7
  ; next_piece = random
  LDI r16, 0x40D7
  ; RAND r17; LDI r18, 7; MOD r17, r18; STORE r16, r17
    LDI r16, 0x40D7
  ; reset position
  LDI r16, 0x40D1
  ; LDI r17, 3; STORE r16, r17
    LDI r16, 0x40D1
  LDI r16, 0x40D2
  ; LDI r17, 0; STORE r16, r17
    LDI r16, 0x40D2
  LDI r16, 0x40D3
  ; LDI r17, 0; STORE r16, r17
    LDI r16, 0x40D3
  ; check game over (collision at spawn = game over)
  LDI r20, 3
  ; LDI r21, 0; LDI r22, 0
    LDI r20, 3
  LDI r23, 0x40D0
  ; LOAD r23, r23
    LDI r23, 0x40D0
  CALL check_collision
  JNZ r25, sp_go
  POP r31
  ; RET
    POP r31
sp_go:
  LDI r16, 0x40D6
  ; LDI r17, 1; STORE r16, r17
    LDI r16, 0x40D6
  POP r31
  ; RET
    POP r31

; --- try_left ---
try_left:
  PUSH r31
  LDI r20, 0x40D1
  ; LOAD r20, r20; JZ r20, tl_d
    LDI r20, 0x40D1
  SUB r20, r1
  LDI r21, 0x40D2
  ; LOAD r21, r21
    LDI r21, 0x40D2
  LDI r22, 0x40D3
  ; LOAD r22, r22
    LDI r22, 0x40D3
  LDI r23, 0x40D0
  ; LOAD r23, r23
    LDI r23, 0x40D0
  CALL check_collision
  JNZ r25, tl_d
  LDI r16, 0x40D1
  ; STORE r16, r20
    LDI r16, 0x40D1
tl_d:
  POP r31
  ; RET
    POP r31

; --- try_right ---
try_right:
  PUSH r31
  LDI r20, 0x40D1
  ; LOAD r20, r20; ADD r20, r1
    LDI r20, 0x40D1
  LDI r21, 0x40D2
  ; LOAD r21, r21
    LDI r21, 0x40D2
  LDI r22, 0x40D3
  ; LOAD r22, r22
    LDI r22, 0x40D3
  LDI r23, 0x40D0
  ; LOAD r23, r23
    LDI r23, 0x40D0
  CALL check_collision
  JNZ r25, tr_d
  LDI r16, 0x40D1
  ; STORE r16, r20
    LDI r16, 0x40D1
tr_d:
  POP r31
  ; RET
    POP r31

; --- try_rot ---
try_rot:
  PUSH r31
  LDI r20, 0x40D1
  ; LOAD r20, r20
    LDI r20, 0x40D1
  LDI r21, 0x40D2
  ; LOAD r21, r21
    LDI r21, 0x40D2
  LDI r22, 0x40D3
  ; LOAD r22, r22; ADD r22, r1
    LDI r22, 0x40D3
  LDI r19, 4
  ; CMP r22, r19; BLT r0, tr_ck; LDI r22, 0
    LDI r19, 4
tr_ck:
  LDI r23, 0x40D0
  ; LOAD r23, r23
    LDI r23, 0x40D0
  CALL check_collision
  JNZ r25, tr_d2
  LDI r16, 0x40D3
  ; STORE r16, r22
    LDI r16, 0x40D3
tr_d2:
  POP r31
  ; RET
    POP r31

; --- try_sdrop ---
try_sdrop:
  PUSH r31
  LDI r20, 0x40D1
  ; LOAD r20, r20
    LDI r20, 0x40D1
  LDI r21, 0x40D2
  ; LOAD r21, r21; ADD r21, r1
    LDI r21, 0x40D2
  LDI r22, 0x40D3
  ; LOAD r22, r22
    LDI r22, 0x40D3
  LDI r23, 0x40D0
  ; LOAD r23, r23
    LDI r23, 0x40D0
  CALL check_collision
  JNZ r25, ts_d
  LDI r16, 0x40D2
  ; LOAD r17, r16; ADD r17, r1; STORE r16, r17
    LDI r16, 0x40D2
  LDI r16, 0x40D4
  ; LOAD r17, r16; ADD r17, r1; STORE r16, r17
    LDI r16, 0x40D4
ts_d:
  POP r31
  ; RET
    POP r31

; --- hard_drop ---
hard_drop:
  PUSH r31
hd_lp:
  LDI r20, 0x40D1
  ; LOAD r20, r20
    LDI r20, 0x40D1
  LDI r21, 0x40D2
  ; LOAD r21, r21; ADD r21, r1
    LDI r21, 0x40D2
  LDI r22, 0x40D3
  ; LOAD r22, r22
    LDI r22, 0x40D3
  LDI r23, 0x40D0
  ; LOAD r23, r23
    LDI r23, 0x40D0
  CALL check_collision
  JNZ r25, hd_lk
  LDI r16, 0x40D2
  ; LOAD r17, r16; ADD r17, r1; STORE r16, r17
    LDI r16, 0x40D2
  JMP hd_lp
hd_lk:
  CALL lock_piece
  CALL clear_lines
  CALL update_score
  CALL spawn_piece
  POP r31
  ; RET
    POP r31

; --- do_gravity ---
do_gravity:
  PUSH r31
  ; increment timer
  LDI r16, 0x40D9
  ; LOAD r17, r16; ADD r17, r1; STORE r16, r17
    LDI r16, 0x40D9
  ; compute speed = max(5, 50 - level*5)
  LDI r16, 0x40DA
  ; LOAD r17, r16
    LDI r16, 0x40DA
  LDI r18, 5
  ; MUL r17, r18
    LDI r18, 5
  LDI r18, 50
  ; SUB r18, r17
    LDI r18, 50
  LDI r19, 5
  ; CMP r18, r19; BGE r0, dg_ck; LDI r18, 5
    LDI r19, 5
dg_ck:
  ; compare timer
  LDI r16, 0x40D9
  ; LOAD r17, r16
    LDI r16, 0x40D9
  CMP r17, r18
  ; BLT r0, dg_d
    CMP r17, r18
  ; reset timer
  LDI r16, 0x40D9
  ; LDI r17, 0; STORE r16, r17
    LDI r16, 0x40D9
  ; try drop
  LDI r20, 0x40D1
  ; LOAD r20, r20
    LDI r20, 0x40D1
  LDI r21, 0x40D2
  ; LOAD r21, r21; ADD r21, r1
    LDI r21, 0x40D2
  LDI r22, 0x40D3
  ; LOAD r22, r22
    LDI r22, 0x40D3
  LDI r23, 0x40D0
  ; LOAD r23, r23
    LDI r23, 0x40D0
  CALL check_collision
  JNZ r25, dg_lk
  LDI r16, 0x40D2
  ; LOAD r17, r16; ADD r17, r1; STORE r16, r17
    LDI r16, 0x40D2
  JMP dg_d
dg_lk:
  CALL lock_piece
  CALL clear_lines
  CALL update_score
  CALL spawn_piece
dg_d:
  POP r31
  ; RET
    POP r31

; --- draw_border ---
draw_border:
  PUSH r31
  LDI r16, 0x444444
  LDI r17, 77
  ; LDI r18, 27; LDI r19, 179; LINE r17, r18, r19, r18, r16
    LDI r17, 77
  LDI r18, 229
  ; LINE r17, r18, r19, r18, r16
    LDI r18, 229
  LDI r17, 77
  ; LDI r18, 27; LDI r19, 229; LINE r17, r18, r17, r19, r16
    LDI r17, 77
  LDI r17, 179
  ; LINE r17, r18, r17, r19, r16
    LDI r17, 179
  POP r31
  ; RET
    POP r31

; --- draw_board_cells ---
draw_board_cells:
  PUSH r31
  LDI r16, 0
dbc_r:
  LDI r17, 0
dbc_c:
  LDI r18, 0x4000
  MOV r19, r16
  ; LDI r20, 10; MUL r19, r20; ADD r18, r19; ADD r18, r17
    MOV r19, r16
  LOAD r18, r18
  ; JZ r18, dbc_n
    LOAD r18, r18
  MOV r19, r17
  ; LDI r20, 10; MUL r19, r20; LDI r20, 78; ADD r19, r20
    MOV r19, r17
  MOV r20, r16
  ; LDI r21, 10; MUL r20, r21; LDI r21, 28; ADD r20, r21
    MOV r20, r16
  LDI r21, 9
  ; LDI r22, 9; RECTF r19, r20, r21, r22, r18
    LDI r21, 9
dbc_n:
  ADD r17, r1
  ; CMP r17, r2; BLT r0, dbc_c
    ADD r17, r1
  ADD r16, r1
  ; CMP r16, r3; BLT r0, dbc_r
    ADD r16, r1
  POP r31
  ; RET
    POP r31

; --- draw_cur_piece ---
draw_cur_piece:
  PUSH r31
  LDI r20, 0x40D1
  ; LOAD r20, r20
    LDI r20, 0x40D1
  LDI r21, 0x40D2
  ; LOAD r21, r21
    LDI r21, 0x40D2
  LDI r22, 0x40D3
  ; LOAD r22, r22
    LDI r22, 0x40D3
  LDI r23, 0x40D0
  ; LOAD r23, r23
    LDI r23, 0x40D0
  LDI r16, 0x42C0
  ; ADD r16, r23; LOAD r16, r16
    LDI r16, 0x42C0
  LDI r24, 0
dp_r:
  MOV r17, r23
  ; LDI r18, 16; MUL r17, r18
    MOV r17, r23
  MOV r18, r22
  ; LDI r19, 4; MUL r18, r19
    MOV r18, r22
  ADD r17, r18
  ; ADD r17, r24; LDI r18, 0x4100; ADD r17, r18
    ADD r17, r18
  LOAD r17, r17
  LDI r18, 0
dp_c:
  MOV r19, r18
  ; LDI r26, 8; SHR r26, r19
    MOV r19, r18
  MOV r19, r17
  ; AND r19, r26; JZ r19, dp_n
    MOV r19, r17
  MOV r19, r20
  ; ADD r19, r18; LDI r26, 10; MUL r19, r26; LDI r26, 78; ADD r19, r26
    MOV r19, r20
  MOV r26, r21
  ; ADD r26, r24; LDI r27, 10; MUL r26, r27; LDI r27, 28; ADD r26, r27
    MOV r26, r21
  LDI r27, 9
  ; LDI r28, 9; RECTF r19, r26, r27, r28, r16
    LDI r27, 9
dp_n:
  ADD r18, r1
  ; LDI r19, 4; CMP r18, r19; BLT r0, dp_c
    ADD r18, r1
  ADD r24, r1
  ; LDI r19, 4; CMP r24, r19; BLT r0, dp_r
    ADD r24, r1
  POP r31
  ; RET
    POP r31

; --- draw_preview ---
draw_preview:
  PUSH r31
  LDI r16, 0x40D7
  ; LOAD r16, r16
    LDI r16, 0x40D7
  LDI r17, 0x42C0
  ; ADD r17, r16; LOAD r17, r17
    LDI r17, 0x42C0
  LDI r18, 0
dpr_r:
  MOV r19, r16
  ; LDI r20, 16; MUL r19, r20
    MOV r19, r16
  ADD r19, r18
  ; LDI r20, 0x4100; ADD r19, r20
    ADD r19, r18
  LOAD r19, r19
  LDI r20, 0
dpr_c:
  MOV r21, r20
  ; LDI r22, 8; SHR r22, r21
    MOV r21, r20
  MOV r21, r19
  ; AND r21, r22; JZ r21, dpr_n
    MOV r21, r19
  MOV r21, r20
  ; LDI r22, 8; MUL r21, r22; LDI r22, 195; ADD r21, r22
    MOV r21, r20
  MOV r22, r18
  ; LDI r23, 8; MUL r22, r23; LDI r23, 50; ADD r22, r23
    MOV r22, r18
  LDI r23, 7
  ; LDI r24, 7; RECTF r21, r22, r23, r24, r17
    LDI r23, 7
dpr_n:
  ADD r20, r1
  ; LDI r21, 4; CMP r20, r21; BLT r0, dpr_c
    ADD r20, r1
  ADD r18, r1
  ; LDI r21, 4; CMP r18, r21; BLT r0, dpr_r
    ADD r18, r1
  POP r31
  ; RET
    POP r31

; --- draw_hud ---
draw_hud:
  PUSH r31
  LDI r16, 195
  ; LDI r17, 38; LDI r18, 0x4320; TEXT r16, r17, r18
    LDI r16, 195
  LDI r16, 190
  ; LDI r17, 100; LDI r18, 0x4325; TEXT r16, r17, r18
    LDI r16, 190
  LDI r16, 0x40D4
  ; LOAD r20, r16; LDI r21, 0x4341; CALL int_to_str
    LDI r16, 0x40D4
  LDI r16, 190
  ; LDI r17, 112; LDI r18, 0x4341; TEXT r16, r17, r18
    LDI r16, 190
  LDI r16, 190
  ; LDI r17, 132; LDI r18, 0x432B; TEXT r16, r17, r18
    LDI r16, 190
  LDI r16, 0x40D5
  ; LOAD r20, r16; LDI r21, 0x4341; CALL int_to_str
    LDI r16, 0x40D5
  LDI r16, 190
  ; LDI r17, 144; LDI r18, 0x4341; TEXT r16, r17, r18
    LDI r16, 190
  LDI r16, 190
  ; LDI r17, 164; LDI r18, 0x4331; TEXT r16, r17, r18
    LDI r16, 190
  LDI r16, 0x40DA
  ; LOAD r20, r16; LDI r21, 0x4341; CALL int_to_str
    LDI r16, 0x40DA
  LDI r16, 190
  ; LDI r17, 176; LDI r18, 0x4341; TEXT r16, r17, r18
    LDI r16, 190
  POP r31
  ; RET
    POP r31

; --- int_to_str ---
; Input: r20=number, r21=buffer address
; Writes decimal string + null terminator
int_to_str:
  JNZ r20, its_div
  LDI r17, 48
  ; STORE r21, r17; ADD r21, r1; STORE r21, r4; RET
    LDI r17, 48
its_div:
  LDI r22, 0
  ; LDI r23, 10
    LDI r22, 0
its_lp:
  MOV r24, r20
  ; DIV r24, r23
    MOV r24, r20
  MOV r25, r20
  ; MOD r25, r23; LDI r26, 48; ADD r25, r26
    MOV r25, r20
  PUSH r25
  ; ADD r22, r1; MOV r20, r24; JNZ r20, its_lp
    PUSH r25
its_pop:
  POP r25
  ; STORE r21, r25; ADD r21, r1
    POP r25
  SUB r22, r1
  ; JNZ r22, its_pop
    SUB r22, r1
  STORE r21, r4
  ; RET
    STORE r21, r4
