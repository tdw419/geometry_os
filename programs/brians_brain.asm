; brians_brain.asm -- Brian's Brain cellular automaton
;
; 3-state CA: off (0), firing (1), refractory (2)
; Rules:
;   Off -> Firing if exactly 2 neighbors are firing
;   Firing -> Refractory
;   Refractory -> Off
;
; Grid: 64x64 cells, 4x4 pixel cells, fills 256x256 screen
; Memory:
;   0x2000-0x2FFF: front buffer (4096 words, one per cell)
;   0x3000-0x3FFF: back buffer (4096 words)

; ===== Constants =====
LDI r7, 1
LDI r9, 64
LDI r10, 0x2000
LDI r11, 0x3000
LDI r12, 4
LDI r20, 0xFFFFFF
LDI r21, 0x888888
LDI r30, 0xFF00    ; stack pointer

; ===== Random initialization =====
LDI r1, 0
init_y:
  LDI r2, 0
init_x:
    ; Random state: 0=off, 1=firing, 2=refractory
    RAND r3
    ANDI r3, 0x03
    CMP r3, r7
    BLT r0, init_store
    ; r3 >= 1, keep as firing or refractory
  init_store:
    MOV r4, r1
    SHL r4, r7
    SHL r4, r7
    SHL r4, r7
    SHL r4, r7
    SHL r4, r7
    SHL r4, r7
    ADD r4, r2
    ADD r4, r10
    STORE r4, r3
    ADD r2, r7
    CMP r2, r9
    BLT r0, init_x
  ADD r1, r7
  CMP r1, r9
  BLT r0, init_y

; ===== Main loop =====
frame_loop:
  LDI r1, 0
update_y:
  LDI r2, 0
update_x:
    ; Compute cell address: front[y*64 + x]
    MOV r3, r1
    SHL r3, r7
    SHL r3, r7
    SHL r3, r7
    SHL r3, r7
    SHL r3, r7
    SHL r3, r7
    ADD r3, r2
    ADD r3, r10
    LOAD r4, r3
    ; r4 = current state

    ; Count firing neighbors (state == 1)
    LDI r5, 0

    ; Neighbor offsets: dy in {-1,0,1}, dx in {-1,0,1}, skip (0,0)
    LDI r13, 0xFFFFFFFF  ; -1 as unsigned
    LDI r14, 1

    ; dy = -1
    MOV r15, r1
    ADD r15, r13
    ANDI r15, 0x3F
    CALL count_row

    ; dy = 0
    MOV r15, r1
    CALL count_row_skip_center

    ; dy = 1
    MOV r15, r1
    ADD r15, r14
    ANDI r15, 0x3F
    CALL count_row

    ; Apply rules
    CMP r4, r7
    BLT r0, rule_off
    JZ r0, rule_firing
    JMP rule_refractory

  rule_off:
    CMP r5, r14
    BLT r0, next_cell
    LDI r6, 2
    CMP r5, r6
    BLT r0, set_firing
    JMP next_cell
  set_firing:
    LDI r4, 1
    JMP store_back

  rule_firing:
    LDI r4, 2
    JMP store_back

  rule_refractory:
    LDI r4, 0
    JMP store_back

  store_back:
    ; Store to back buffer
    MOV r3, r1
    SHL r3, r7
    SHL r3, r7
    SHL r3, r7
    SHL r3, r7
    SHL r3, r7
    SHL r3, r7
    ADD r3, r2
    ADD r3, r11
    STORE r3, r4

    ; Draw cell
    MOV r3, r2
    SHL r3, r7
    SHL r3, r7
    MOV r16, r1
    SHL r16, r7
    SHL r16, r7

    CMP r4, r7
    BLT r0, draw_off
    JZ r0, draw_firing
    ; refractory
    RECTF r3, r16, r12, r12, r21
    JMP next_cell
  draw_firing:
    RECTF r3, r16, r12, r12, r20
    JMP next_cell
  draw_off:
    ; off cells are drawn as black (clear screen first, so no need to draw)

  next_cell:
    ADD r2, r7
    CMP r2, r9
    BLT r0, update_x
  ADD r1, r7
  CMP r1, r9
  BLT r0, update_y

  ; Swap buffers: copy back to front
  LDI r1, 0
  LDI r30, 0x1000
swap_loop:
  ADD r1, r10
  LOAD r2, r1
  SUB r1, r10
  ADD r1, r11
  STORE r1, r2
  SUB r1, r11
  ADD r1, r7
  CMP r1, r30
  BLT r0, swap_loop

  FRAME
  JMP frame_loop

; ===== Subroutine: count firing in a row =====
count_row:
  ; r15 = dy, r2 = current x
  ; Check dx = -1, 0, 1
  PUSH r31

  ; dx = -1
  MOV r16, r2
  ADD r16, r13
  ANDI r16, 0x3F
  CALL check_cell

  ; dx = 0
  MOV r16, r2
  CALL check_cell

  ; dx = 1
  MOV r16, r2
  ADD r16, r14
  ANDI r16, 0x3F
  CALL check_cell

  POP r31
  RET

count_row_skip_center:
  ; Same as count_row but skip dx=0
  PUSH r31

  MOV r16, r2
  ADD r16, r13
  ANDI r16, 0x3F
  CALL check_cell

  MOV r16, r2
  ADD r16, r14
  ANDI r16, 0x3F
  CALL check_cell

  POP r31
  RET

check_cell:
  ; r15 = dy, r16 = dx
  ; Load cell at (dy, dx) from front buffer
  PUSH r31
  MOV r17, r15
  SHL r17, r7
  SHL r17, r7
  SHL r17, r7
  SHL r17, r7
  SHL r17, r7
  SHL r17, r7
  ADD r17, r16
  ADD r17, r10
  LOAD r18, r17
  CMP r18, r7
  JZ r0, is_firing
  JMP check_done
is_firing:
  ADD r5, r7
check_done:
  POP r31
  RET
