; DESCRIPTION: Render a colored object at the screen.

; register_dashboard.asm
; Phase 50: Live Register Dashboard
;
; The canvas grid shows live register values as 4-digit decimals.
; r12 counts up each frame. r9-r16 derive from r12 via arithmetic.
; 8 registers per row, 4 digits each, 2 rows = 16 registers.
; The grid IS the debug view -- no separate inspector.
;
; Layout (canvas buffer indices, addresses = 0x8000 + index):
;   Row 0: r12@0  r9@4  r11@8  r4@12  r0@16  r2@20  r10@24  r14@28
;   Row 1: r8@32 r15@36 r13@40 r3@44 r1@48 r7@52 r6@56 r16@60
;
; Register computations (from r12 = frame counter):
;   r9  = r12 * 2        (double)
;   r11  = r12 * 3        (triple)
;   r4  = r12 * 4        (quadruple)
;   r0  = r12 & 255      (low byte)
;   r2  = r12 * r12       (square)
;   r10  = r12 XOR 0xAAAA (pseudo-random)
;   r14  = r12 << 4       (shifted)
;   r8  = -r12           (negated)
;   r15 = r12 % 17       (modular)
;   r13 = r0 + r2       (sum)
;   r3 = r2 >> 8       (upper square)
;   r1 = r12 | 0x0F0F   (bitmask)
;   r7 = r10 & r14       (combination)
;   r6 = r12 + r8       (zero: r12 + NEG(r12))
;   r16 = r14 - r12       (r12 * 15)

  LDI r30, 0xFF00      ; Stack pointer for CALL/RET
  LDI r20, 10          ; Divisor constant
  LDI r21, 48          ; ASCII '0'
  LDI r22, 1           ; Increment constant

main_loop:
  ; === Update register values ===
  ADD r12, r22           ; r12 = frame counter (1, 2, 3, ...)

  MOV r9, r12            ; r9 = r12 * 2
  ADD r9, r12

  MOV r11, r9            ; r11 = r12 * 3
  ADD r11, r12

  MOV r4, r9            ; r4 = r12 * 4
  ADD r4, r9

  MOV r0, r12            ; r0 = r12 & 0xFF (low byte)
  LDI r23, 255
  AND r0, r23

  MOV r2, r12            ; r2 = r12 * r12 (square)
  MUL r2, r12

  MOV r10, r12            ; r10 = r12 XOR 0xAAAA
  LDI r23, 43690
  XOR r10, r23

  MOV r14, r12            ; r14 = r12 << 4
  LDI r23, 4
  SHL r14, r23

  MOV r8, r12            ; r8 = -r12 (negated)
  NEG r8

  MOV r15, r12           ; r15 = r12 % 17
  LDI r23, 17
  MOD r15, r23

  MOV r13, r0           ; r13 = r0 + r2
  ADD r13, r2

  MOV r3, r2           ; r3 = r2 >> 8
  LDI r23, 8
  SHR r3, r23

  MOV r1, r12           ; r1 = r12 | 0x0F0F
  LDI r23, 3855
  OR r1, r23

  MOV r7, r10           ; r7 = r10 & r14
  AND r7, r14

  MOV r6, r12           ; r6 = r12 + r8 = 0
  ADD r6, r8

  MOV r16, r14           ; r16 = r14 - r12 = r12*15
  SUB r16, r12

  ; === Display registers to canvas ===
  ; Row 0 (canvas indices 0-31)
  LDI r25, 0x8000
  MOV r26, r12
  CALL write_digits

  LDI r25, 0x8004
  MOV r26, r9
  CALL write_digits

  LDI r25, 0x8008
  MOV r26, r11
  CALL write_digits

  LDI r25, 0x800C
  MOV r26, r4
  CALL write_digits

  LDI r25, 0x8010
  MOV r26, r0
  CALL write_digits

  LDI r25, 0x8014
  MOV r26, r2
  CALL write_digits

  LDI r25, 0x8018
  MOV r26, r10
  CALL write_digits

  LDI r25, 0x801C
  MOV r26, r14
  CALL write_digits

  ; Row 1 (canvas indices 32-63)
  LDI r25, 0x8020
  MOV r26, r8
  CALL write_digits

  LDI r25, 0x8024
  MOV r26, r15
  CALL write_digits

  LDI r25, 0x8028
  MOV r26, r13
  CALL write_digits

  LDI r25, 0x802C
  MOV r26, r3
  CALL write_digits

  LDI r25, 0x8030
  MOV r26, r1
  CALL write_digits

  LDI r25, 0x8034
  MOV r26, r7
  CALL write_digits

  LDI r25, 0x8038
  MOV r26, r6
  CALL write_digits

  LDI r25, 0x803C
  MOV r26, r16
  CALL write_digits

  FRAME
  JMP main_loop

; === Subroutine: write 4 decimal digits of r26 to canvas at r25 ===
; Preserves r25, r26. Uses r27, r28, r29 (pushed/popped).
write_digits:
  PUSH r27
  PUSH r28
  PUSH r29

  ; Ones: (r26 % 10) + '0' -> [r25 + 3]
  MOV r27, r26
  MOD r27, r20
  ADD r27, r21
  LDI r28, 3
  MOV r29, r25
  ADD r29, r28
  STORE r29, r27

  ; Tens: ((r26 / 10) % 10) + '0' -> [r25 + 2]
  MOV r27, r26
  DIV r27, r20
  MOD r27, r20
  ADD r27, r21
  LDI r28, 2
  MOV r29, r25
  ADD r29, r28
  STORE r29, r27

  ; Hundreds: ((r26 / 100) % 10) + '0' -> [r25 + 1]
  MOV r27, r26
  LDI r28, 100
  DIV r27, r28
  MOD r27, r20
  ADD r27, r21
  LDI r28, 1
  MOV r29, r25
  ADD r29, r28
  STORE r29, r27

  ; Thousands: ((r26 / 1000) % 10) + '0' -> [r25]
  MOV r27, r26
  LDI r28, 1000
  DIV r27, r28
  MOD r27, r20
  ADD r27, r21
  STORE r25, r27

  POP r29
  POP r28
  POP r27
  RET
