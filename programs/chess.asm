; chess.asm -- Two-player chess for Geometry OS
; Board: 8x8, each cell 32x32 pixels, fills 256x256 screen
; Controls: Arrow keys=move cursor, Space/Enter=select/move, R=restart
;
; Piece codes (board array at 0x2000 + row*8 + col):
;   0=empty
;   1=white pawn   7=black pawn
;   2=white rook   8=black rook
;   3=white knight 9=black knight
;   4=white bishop 10=black bishop
;   5=white queen  11=black queen
;   6=white king   12=black king
;
; State at 0x2100:
;   0x2100=cursor_col  0x2101=cursor_row
;   0x2102=sel_col(8=none) 0x2103=sel_row
;   0x2104=turn(0=white,1=black) 0x2105=game_over(0/1/2)
;   0x2110=prev_bitmask (for press detection)
;
; Color table at 0x2200-0x220B (indexed by piece_code-1 via 0x21FF+code)
;
; Register conventions:
;   r0=CMP result ONLY  r7=key bitmask  r8=1  r9=0
;   r10-r15=function args  r20-r29=preserved

; ===== INIT =====
start:
  LDI r30, 0x8000

  ; Row 0 -- black pieces: 8,9,10,11,12,10,9,8
  LDI r4, 0x2000
  LDI r1, 8
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 9
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 10
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 11
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 12
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 10
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 9
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 8
  STORE r4, r1

  ; Row 1 -- black pawns
  LDI r2, 0
  LDI r5, 8
bp_lp:
  ADDI r4, 1
  LDI r1, 7
  STORE r4, r1
  ADDI r2, 1
  CMP r2, r5
  BLT r0, bp_lp

  ; Rows 2-5 -- empty (32 squares)
  LDI r2, 0
  LDI r5, 32
em_lp:
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1
  ADDI r2, 1
  CMP r2, r5
  BLT r0, em_lp

  ; Row 6 -- white pawns
  LDI r2, 0
  LDI r5, 8
wp_lp:
  ADDI r4, 1
  LDI r1, 1
  STORE r4, r1
  ADDI r2, 1
  CMP r2, r5
  BLT r0, wp_lp

  ; Row 7 -- white pieces: 2,3,4,5,6,4,3,2
  ADDI r4, 1
  LDI r1, 2
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 3
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 4
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 5
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 6
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 4
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 3
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 2
  STORE r4, r1

  ; Init state
  LDI r4, 0x2100
  LDI r1, 4
  STORE r4, r1
  LDI r4, 0x2101
  LDI r1, 4
  STORE r4, r1
  LDI r4, 0x2102
  LDI r1, 8
  STORE r4, r1
  LDI r4, 0x2103
  LDI r1, 0
  STORE r4, r1
  LDI r4, 0x2104
  LDI r1, 0
  STORE r4, r1
  LDI r4, 0x2105
  LDI r1, 0
  STORE r4, r1
  LDI r4, 0x2110
  LDI r1, 0
  STORE r4, r1

  ; Init piece color table at 0x2200-0x220B
  LDI r4, 0x2200
  LDI r1, 0xCCCCCC
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0x8899FF
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0xBB88FF
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0xFF88AA
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0xFFCC22
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0x22FF22
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0x666666
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0x334488
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0x553388
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0x883344
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0x887722
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0x118811
  STORE r4, r1

  JMP game_loop

; ===== MAIN GAME LOOP =====
game_loop:
  ; Check game over
  LDI r4, 0x2105
  LOAD r1, r4
  JNZ r1, game_over_screen

  ; Read key bitmask
  LDI r4, 0xFFB
  LOAD r7, r4

  ; Detect newly pressed keys (Space/Enter)
  LDI r4, 0x2110
  LOAD r3, r4
  MOV r5, r7
  XOR r5, r3
  AND r5, r7
  LDI r4, 0x2110
  STORE r4, r7

  ; Check R key via IKEY
  IKEY r1
  CMPI r1, 82
  JZ r0, start
  CMPI r1, 114
  JZ r0, start

  ; Throttle cursor movement (every 8th frame)
  LDI r4, 0xFFE
  LOAD r1, r4
  ANDI r1, 7
  JNZ r1, skip_cursor

  ; Up (bit 0)
  MOV r1, r7
  ANDI r1, 1
  JZ r1, chk_down
  LDI r4, 0x2101
  LOAD r2, r4
  JZ r2, chk_down
  SUBI r2, 1
  STORE r4, r2

chk_down:
  MOV r1, r7
  ANDI r1, 2
  JZ r1, chk_left
  LDI r4, 0x2101
  LOAD r2, r4
  CMPI r2, 7
  BGE r0, chk_left
  ADDI r2, 1
  STORE r4, r2

chk_left:
  MOV r1, r7
  ANDI r1, 4
  JZ r1, chk_right
  LDI r4, 0x2100
  LOAD r2, r4
  JZ r2, chk_right
  SUBI r2, 1
  STORE r4, r2

chk_right:
  MOV r1, r7
  ANDI r1, 8
  JZ r1, skip_cursor
  LDI r4, 0x2100
  LOAD r2, r4
  CMPI r2, 7
  BGE r0, skip_cursor
  ADDI r2, 1
  STORE r4, r2

skip_cursor:
  ; Check Space (bit 4) or Enter (bit 5) newly pressed
  MOV r1, r5
  ANDI r1, 16
  JNZ r1, handle_select
  MOV r1, r5
  ANDI r1, 32
  JNZ r1, handle_select
  JMP do_render

; ===== SELECTION HANDLING =====
handle_select:
  ; Load selection state
  LDI r4, 0x2102
  LOAD r1, r4
  CMPI r1, 8
  JZ r0, sel_phase0
  JMP sel_phase1

; -- Phase 0: select own piece at cursor --
sel_phase0:
  LDI r4, 0x2100
  LOAD r10, r4
  LDI r4, 0x2101
  LOAD r11, r4

  ; Load piece at cursor
  MOV r1, r11
  SHLI r1, 3
  ADD r1, r10
  LDI r2, 0x2000
  ADD r1, r2
  LOAD r6, r1

  ; Must be non-empty
  JZ r6, do_render

  ; Must be own piece
  LDI r4, 0x2104
  LOAD r3, r4
  JZ r3, sp0_white
  ; Black turn: need piece 7-12
  CMPI r6, 7
  BLT r0, do_render
  JMP sp0_ok
sp0_white:
  CMPI r6, 7
  BGE r0, do_render
sp0_ok:
  LDI r4, 0x2102
  STORE r4, r10
  LDI r4, 0x2103
  STORE r4, r11
  JMP do_render

; -- Phase 1: select destination or reselect --
sel_phase1:
  LDI r4, 0x2100
  LOAD r10, r4
  LDI r4, 0x2101
  LOAD r11, r4
  LDI r4, 0x2102
  LOAD r12, r4
  LDI r4, 0x2103
  LOAD r13, r4

  ; Check deselect (cursor on selected piece)
  CMP r10, r12
  JNZ r0, sp1_check_rs
  CMP r11, r13
  JNZ r0, sp1_check_rs
  LDI r4, 0x2102
  LDI r1, 8
  STORE r4, r1
  JMP do_render

sp1_check_rs:
  ; Check if cursor has own piece (reselect)
  MOV r1, r11
  SHLI r1, 3
  ADD r1, r10
  LDI r2, 0x2000
  ADD r1, r2
  LOAD r6, r1
  JZ r6, sp1_try_move

  LDI r4, 0x2104
  LOAD r3, r4
  JZ r3, sp1_rsw
  CMPI r6, 7
  BLT r0, sp1_try_move
  JMP sp1_reselect
sp1_rsw:
  CMPI r6, 7
  BGE r0, sp1_try_move
sp1_reselect:
  LDI r4, 0x2102
  STORE r4, r10
  LDI r4, 0x2103
  STORE r4, r11
  JMP do_render

sp1_try_move:
  ; Set up validate_move args: from=selection, to=cursor
  MOV r20, r10
  MOV r21, r11
  MOV r10, r12
  MOV r11, r13
  MOV r12, r20
  MOV r13, r21

  PUSH r31
  CALL validate_move
  POP r31

  ; r14=1 valid, 0 invalid
  JZ r14, do_render

  ; Execute move -- load source piece
  MOV r1, r11
  SHLI r1, 3
  ADD r1, r10
  LDI r2, 0x2000
  ADD r1, r2
  LOAD r3, r1

  ; Load dest piece (for capture check)
  PUSH r1
  MOV r1, r13
  SHLI r1, 3
  ADD r1, r12
  LDI r2, 0x2000
  ADD r1, r2
  LOAD r4, r1

  ; Store source piece at dest
  STORE r1, r3

  ; Clear source
  POP r1
  LDI r3, 0
  STORE r1, r3

  ; Check king capture
  CMPI r4, 6
  JZ r0, go_white_wins
  CMPI r4, 12
  JZ r0, go_black_wins

  ; Pawn promotion
  MOV r1, r13
  SHLI r1, 3
  ADD r1, r12
  LDI r2, 0x2000
  ADD r1, r2
  LOAD r3, r1
  CMPI r3, 1
  JNZ r0, promo_blk
  CMPI r13, 0
  JNZ r0, promo_done
  LDI r3, 5
  STORE r1, r3
  JMP promo_done
promo_blk:
  CMPI r3, 7
  JNZ r0, promo_done
  CMPI r13, 7
  JNZ r0, promo_done
  LDI r3, 11
  STORE r1, r3
promo_done:

  ; Move sound
  LDI r14, 440
  LDI r15, 80
  BEEP r14, r15

  ; Switch turn
  LDI r4, 0x2104
  LOAD r1, r4
  LDI r2, 1
  XOR r1, r2
  STORE r4, r1

  ; Deselect
  LDI r4, 0x2102
  LDI r1, 8
  STORE r4, r1

  JMP do_render

go_white_wins:
  LDI r4, 0x2105
  LDI r1, 1
  STORE r4, r1
  JMP do_render

go_black_wins:
  LDI r4, 0x2105
  LDI r1, 2
  STORE r4, r1
  JMP do_render

; ===== RENDER =====
do_render:
  PUSH r31
  CALL render_all
  POP r31
  FRAME
  JMP game_loop

render_all:
  PUSH r31

  ; Cache state into registers
  LDI r4, 0x2100
  LOAD r22, r4
  LDI r4, 0x2101
  LOAD r23, r4
  LDI r4, 0x2102
  LOAD r24, r4
  LDI r4, 0x2103
  LOAD r25, r4
  LDI r4, 0x2104
  LOAD r26, r4

  LDI r20, 0
r_row:
  LDI r21, 0
r_col:
  ; Background color
  CMP r21, r22
  JNZ r0, r_notcur
  CMP r20, r23
  JNZ r0, r_notcur
  ; Cursor cell -- color by turn
  JZ r26, r_curw
  LDI r3, 0x00FFFF
  JMP r_bg
r_curw:
  LDI r3, 0xFFFF00
  JMP r_bg

r_notcur:
  CMP r21, r24
  JNZ r0, r_notsel
  CMP r20, r25
  JNZ r0, r_notsel
  LDI r3, 0x44FF44
  JMP r_bg

r_notsel:
  MOV r3, r20
  ADD r3, r21
  ANDI r3, 1
  JZ r3, r_light
  LDI r3, 0x886633
  JMP r_bg
r_light:
  LDI r3, 0xEECC88

r_bg:
  ; Draw cell background
  MOV r1, r21
  SHLI r1, 5
  MOV r2, r20
  SHLI r2, 5
  LDI r4, 32
  LDI r5, 32
  RECTF r1, r2, r4, r5, r3

  ; Load piece
  MOV r1, r20
  SHLI r1, 3
  ADD r1, r21
  LDI r6, 0x2000
  ADD r1, r6
  LOAD r6, r1
  JZ r6, r_nopiece

  ; Draw piece outer (24x24)
  MOV r1, r21
  SHLI r1, 5
  ADDI r1, 4
  MOV r2, r20
  SHLI r2, 5
  ADDI r2, 4
  LDI r4, 24
  LDI r5, 24
  LDI r3, 0x21FF
  ADD r3, r6
  LOAD r3, r3
  RECTF r1, r2, r4, r5, r3

  ; Draw piece inner badge (12x12)
  MOV r1, r21
  SHLI r1, 5
  ADDI r1, 10
  MOV r2, r20
  SHLI r2, 5
  ADDI r2, 10
  LDI r4, 12
  LDI r5, 12
  CMPI r6, 7
  BGE r0, r_darkbadge
  LDI r3, 0xFFFFFF
  JMP r_badge
r_darkbadge:
  LDI r3, 0x222222
r_badge:
  RECTF r1, r2, r4, r5, r3

r_nopiece:
  ADDI r21, 1
  CMPI r21, 8
  BLT r0, r_col
  ADDI r20, 1
  CMPI r20, 8
  BLT r0, r_row

  POP r31
  RET

; ===== MOVE VALIDATION =====
; r10=from_col r11=from_row r12=to_col r13=to_row
; Returns r14=1(valid) or 0(invalid)
validate_move:
  PUSH r31

  ; Load source piece
  MOV r1, r11
  SHLI r1, 3
  ADD r1, r10
  LDI r2, 0x2000
  ADD r1, r2
  LOAD r15, r1

  ; Safety: source must be non-empty
  JZ r15, vm_invalid

  ; Load dest piece
  MOV r1, r13
  SHLI r1, 3
  ADD r1, r12
  ADD r1, r2
  LOAD r16, r1

  ; Source != dest
  CMP r10, r12
  JNZ r0, vm_srcdiff
  CMP r11, r13
  JZ r0, vm_invalid
vm_srcdiff:

  ; Dest must not be own piece
  LDI r4, 0x2104
  LOAD r17, r4
  JZ r17, vm_wturn
  ; Black turn: dest must not be 7-12
  CMPI r16, 7
  BLT r0, vm_dispatch
  JMP vm_invalid
vm_wturn:
  CMPI r16, 1
  BLT r0, vm_dispatch
  CMPI r16, 7
  BGE r0, vm_dispatch
  JMP vm_invalid

vm_dispatch:
  CMPI r15, 1
  JZ r0, vm_pawn
  CMPI r15, 7
  JZ r0, vm_pawn
  CMPI r15, 2
  JZ r0, vm_rook
  CMPI r15, 8
  JZ r0, vm_rook
  CMPI r15, 3
  JZ r0, vm_knight
  CMPI r15, 9
  JZ r0, vm_knight
  CMPI r15, 4
  JZ r0, vm_bishop
  CMPI r15, 10
  JZ r0, vm_bishop
  CMPI r15, 5
  JZ r0, vm_queen
  CMPI r15, 11
  JZ r0, vm_queen
  CMPI r15, 6
  JZ r0, vm_king
  CMPI r15, 12
  JZ r0, vm_king
  JMP vm_invalid

vm_valid:
  LDI r14, 1
  JMP vm_done
vm_invalid:
  LDI r14, 0
vm_done:
  POP r31
  RET

; -- Pawn validation --
vm_pawn:
  ; dx = to_col - from_col, dy = to_row - from_row
  MOV r1, r12
  SUB r1, r10
  MOV r2, r13
  SUB r2, r11

  CMPI r15, 1
  JZ r0, vm_wpawn
  ; Black pawn: forward dy=+1 or +2
  JNZ r1, bp_cap

  ; Forward move
  CMPI r2, 1
  JZ r0, bp_fwd1
  CMPI r2, 2
  JNZ r0, vm_invalid
  ; Double from row 1
  CMPI r11, 1
  JNZ r0, vm_invalid
  JNZ r16, vm_invalid
  ; Check intermediate
  MOV r1, r11
  ADDI r1, 1
  SHLI r1, 3
  ADD r1, r10
  LDI r3, 0x2000
  ADD r1, r3
  LOAD r1, r1
  JNZ r1, vm_invalid
  JMP vm_valid
bp_fwd1:
  JNZ r16, vm_invalid
  JMP vm_valid
bp_cap:
  ; |dx| must be 1, dy must be 1, dest has white piece
  MOV r3, r1
  LDI r6, 0
  CMP r3, r6
  BGE r0, bp_adx
  NEG r3
bp_adx:
  CMPI r3, 1
  JNZ r0, vm_invalid
  CMPI r2, 1
  JNZ r0, vm_invalid
  CMPI r16, 1
  BLT r0, vm_invalid
  CMPI r16, 7
  BGE r0, vm_invalid
  JMP vm_valid

vm_wpawn:
  ; White pawn: forward dy=-1 or -2
  JNZ r1, wp_cap
  ; Forward: dy must be -1 or -2
  MOV r3, r2
  ADDI r3, 1
  JZ r3, wp_fwd1
  MOV r3, r2
  ADDI r3, 2
  JNZ r3, vm_invalid
  ; Double from row 6
  CMPI r11, 6
  JNZ r0, vm_invalid
  JNZ r16, vm_invalid
  ; Check intermediate
  MOV r1, r11
  SUBI r1, 1
  SHLI r1, 3
  ADD r1, r10
  LDI r3, 0x2000
  ADD r1, r3
  LOAD r1, r1
  JNZ r1, vm_invalid
  JMP vm_valid
wp_fwd1:
  JNZ r16, vm_invalid
  JMP vm_valid
wp_cap:
  ; |dx| must be 1, dy=-1, dest has black piece
  MOV r3, r1
  LDI r6, 0
  CMP r3, r6
  BGE r0, wp_adx
  NEG r3
wp_adx:
  CMPI r3, 1
  JNZ r0, vm_invalid
  MOV r3, r2
  ADDI r3, 1
  JNZ r3, vm_invalid
  CMPI r16, 7
  BLT r0, vm_invalid
  JMP vm_valid

; -- Rook validation --
vm_rook:
  MOV r1, r12
  SUB r1, r10
  MOV r2, r13
  SUB r2, r11
  ; Straight line: dx==0 or dy==0 (not both)
  JZ r1, rk_ok
  JZ r2, rk_ok
  JMP vm_invalid
rk_ok:
  PUSH r31
  CALL check_path
  POP r31
  JMP vm_done

; -- Knight validation --
vm_knight:
  MOV r1, r12
  SUB r1, r10
  MOV r2, r13
  SUB r2, r11
  ; |dx| and |dy|
  LDI r6, 0
  CMP r1, r6
  BGE r0, kn_dx
  NEG r1
kn_dx:
  CMP r2, r6
  BGE r0, kn_dy
  NEG r2
kn_dy:
  ; (|dx|==1 and |dy|==2) or (|dx|==2 and |dy|==1)
  CMPI r1, 1
  JNZ r0, kn_21
  CMPI r2, 2
  JZ r0, vm_valid
  JMP vm_invalid
kn_21:
  CMPI r1, 2
  JNZ r0, vm_invalid
  CMPI r2, 1
  JZ r0, vm_valid
  JMP vm_invalid

; -- Bishop validation --
vm_bishop:
  MOV r1, r12
  SUB r1, r10
  MOV r2, r13
  SUB r2, r11
  ; Must be diagonal: dx!=0 and |dx|==|dy|
  JZ r1, vm_invalid
  LDI r6, 0
  CMP r1, r6
  BGE r0, bi_dx
  NEG r1
bi_dx:
  CMP r2, r6
  BGE r0, bi_dy
  NEG r2
bi_dy:
  CMP r1, r2
  JNZ r0, vm_invalid
  PUSH r31
  CALL check_path
  POP r31
  JMP vm_done

; -- Queen validation --
vm_queen:
  MOV r1, r12
  SUB r1, r10
  MOV r2, r13
  SUB r2, r11
  ; Rook-like or bishop-like
  JZ r1, qm_ok
  JZ r2, qm_ok
  ; Check diagonal
  JZ r1, vm_invalid
  LDI r6, 0
  CMP r1, r6
  BGE r0, qm_dx
  NEG r1
qm_dx:
  CMP r2, r6
  BGE r0, qm_dy
  NEG r2
qm_dy:
  CMP r1, r2
  JNZ r0, vm_invalid
qm_ok:
  PUSH r31
  CALL check_path
  POP r31
  JMP vm_done

; -- King validation --
vm_king:
  MOV r1, r12
  SUB r1, r10
  MOV r2, r13
  SUB r2, r11
  ; |dx|<=1 and |dy|<=1
  LDI r6, 0
  CMP r1, r6
  BGE r0, kg_dx
  NEG r1
kg_dx:
  CMP r2, r6
  BGE r0, kg_dy
  NEG r2
kg_dy:
  CMPI r1, 2
  BGE r0, vm_invalid
  CMPI r2, 2
  BGE r0, vm_invalid
  JMP vm_valid

; ===== PATH CHECKING =====
; r10=from_col r11=from_row r12=to_col r13=to_row
; Returns r14=1(clear) or 0(blocked)
check_path:
  PUSH r20
  PUSH r21
  PUSH r22
  PUSH r23

  ; Compute dx direction
  MOV r1, r12
  SUB r1, r10
  LDI r6, 0
  CMP r1, r6
  BLT r0, cp_dxn
  JZ r0, cp_dxz
  LDI r20, 1
  JMP cp_dy
cp_dxn:
  LDI r20, 0
  SUBI r20, 1
  JMP cp_dy
cp_dxz:
  LDI r20, 0

cp_dy:
  ; Compute dy direction
  MOV r1, r13
  SUB r1, r11
  CMP r1, r6
  BLT r0, cp_dyn
  JZ r0, cp_dyz
  LDI r21, 1
  JMP cp_start
cp_dyn:
  LDI r21, 0
  SUBI r21, 1
  JMP cp_start
cp_dyz:
  LDI r21, 0

cp_start:
  MOV r22, r10
  ADD r22, r20
  MOV r23, r11
  ADD r23, r21

cp_loop:
  CMP r22, r12
  JNZ r0, cp_chk
  CMP r23, r13
  JZ r0, cp_clear

cp_chk:
  MOV r1, r23
  SHLI r1, 3
  ADD r1, r22
  LDI r2, 0x2000
  ADD r1, r2
  LOAD r1, r1
  JNZ r1, cp_blocked
  ADD r22, r20
  ADD r23, r21
  JMP cp_loop

cp_clear:
  LDI r14, 1
  JMP cp_ret
cp_blocked:
  LDI r14, 0
cp_ret:
  POP r23
  POP r22
  POP r21
  POP r20
  RET

; ===== GAME OVER SCREEN =====
game_over_screen:
  LDI r4, 0x2105
  LOAD r1, r4
  CMPI r1, 1
  JNZ r0, gos_black
  LDI r1, 0xFFFFFF
  FILL r1
  JMP gos_wait
gos_black:
  LDI r1, 0x333333
  FILL r1
gos_wait:
  IKEY r1
  CMPI r1, 82
  JZ r0, start
  CMPI r1, 114
  JZ r0, start
  FRAME
  JMP gos_wait
