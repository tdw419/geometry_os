; DESCRIPTION: The GeOS assembly code implements a live register dashboard that displays the values of registers `r4` to `r16` as 4-digit decimal numbers on a canvas grid. Each frame, `r4` increments, and subsequent registers derive from `r4` via various arithmetic operations. The register values are then converted to ASCII digits and written to specific canvas buffer addresses for display.

; register_dashboard.asm
; Phase 50: Live Register Dashboard
;
; The canvas grid shows live register values as 4-digit decimals.
; r4 counts up each frame. r8-r16 derive from r4 via arithmetic.
; 8 registers per row, 4 digits each, 2 rows = 16 registers.
; The grid IS the debug view -- no separate inspector.
;
; Layout (canvas buffer indices, addresses = 0x8000 + index):
;   Row 0: r4@0  r8@4  r7@8  r3@12  r15@16  r13@20  r0@24  r2@28
;   Row 1: r14@32 r12@36 r6@40 r10@44 r5@48 r9@52 r1@56 r16@60
;
; Register computations (from r4 = frame counter):
;   r8  = r4 * 2        (double)
;   r7  = r4 * 3        (triple)
;   r3  = r4 * 4        (quadruple)
;   r15  = r4 & 255      (low byte)
;   r13  = r4 * r4       (square)
;   r0  = r4 XOR 0xAAAA (pseudo-random)
;   r2  = r4 << 4       (shifted)
;   r14  = -r4           (negated)
;   r12 = r4 % 17       (modular)
;   r6 = r15 + r13       (sum)
;   r10 = r13 >> 8       (upper square)
;   r5 = r4 | 0x0F0F   (bitmask)
;   r9 = r0 & r2       (combination)
;   r1 = r4 + r14       (zero: r4 + NEG(r4))
;   r16 = r2 - r4       (r4 * 15)

  LDI r30, 0xFF00      ; Stack pointer for CALL/RET
  LDI r20, 10          ; Divisor constant
  LDI r21, 48          ; ASCII '0'
  LDI r22, 1           ; Increment constant

main_loop:
  ; === Update register values ===
  ADD r4, r22           ; r4 = frame counter (1, 2, 3, ...)

  MOV r8, r4            ; r8 = r4 * 2
  ADD r8, r4

  MOV r7, r8            ; r7 = r4 * 3
  ADD r7, r4

  MOV r3, r8            ; r3 = r4 * 4
  ADD r3, r8

  MOV r15, r4            ; r15 = r4 & 0xFF (low byte)
  LDI r23, 255
  AND r15, r23

  MOV r13, r4            ; r13 = r4 * r4 (square)
  MUL r13, r4

  MOV r0, r4            ; r0 = r4 XOR 0xAAAA
  LDI r23, 43690
  XOR r0, r23

  MOV r2, r4            ; r2 = r4 << 4
  LDI r23, 4
  SHL r2, r23

  MOV r14, r4            ; r14 = -r4 (negated)
  NEG r14

  MOV r12, r4           ; r12 = r4 % 17
  LDI r23, 17
  MOD r12, r23

  MOV r6, r15           ; r6 = r15 + r13
  ADD r6, r13

  MOV r10, r13           ; r10 = r13 >> 8
  LDI r23, 8
  SHR r10, r23

  MOV r5, r4           ; r5 = r4 | 0x0F0F
  LDI r23, 3855
  OR r5, r23

  MOV r9, r0           ; r9 = r0 & r2
  AND r9, r2

  MOV r1, r4           ; r1 = r4 + r14 = 0
  ADD r1, r14

  MOV r16, r2           ; r16 = r2 - r4 = r4*15
  SUB r16, r4

  ; === Display registers to canvas ===
  ; Row 0 (canvas indices 0-31)
  LDI r25, 0x8000
  MOV r26, r4
  CALL write_digits

  LDI r25, 0x8004
  MOV r26, r8
  CALL write_digits

  LDI r25, 0x8008
  MOV r26, r7
  CALL write_digits

  LDI r25, 0x800C
  MOV r26, r3
  CALL write_digits

  LDI r25, 0x8010
  MOV r26, r15
  CALL write_digits

  LDI r25, 0x8014
  MOV r26, r13
  CALL write_digits

  LDI r25, 0x8018
  MOV r26, r0
  CALL write_digits

  LDI r25, 0x801C
  MOV r26, r2
  CALL write_digits

  ; Row 1 (canvas indices 32-63)
  LDI r25, 0x8020
  MOV r26, r14
  CALL write_digits

  LDI r25, 0x8024
  MOV r26, r12
  CALL write_digits

  LDI r25, 0x8028
  MOV r26, r6
  CALL write_digits

  LDI r25, 0x802C
  MOV r26, r10
  CALL write_digits

  LDI r25, 0x8030
  MOV r26, r5
  CALL write_digits

  LDI r25, 0x8034
  MOV r26, r9
  CALL write_digits

  LDI r25, 0x8038
  MOV r26, r1
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
