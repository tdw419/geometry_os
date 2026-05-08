; DESCRIPTION: Display a object using color colored at the screen.

; register_dashboard.asm
; Phase 50: Live Register Dashboard
;
; The canvas grid shows live register values as 4-digit decimals.
; r8 counts up each frame. r1-r16 derive from r8 via arithmetic.
; 8 registers per row, 4 digits each, 2 rows = 16 registers.
; The grid IS the debug view -- no separate inspector.
;
; Layout (canvas buffer indices, addresses = 0x8000 + index):
;   Row 0: r8@0  r1@4  r10@8  r9@12  r15@16  r6@20  r14@24  r11@28
;   Row 1: r12@32 r5@36 r3@40 r0@44 r7@48 r13@52 r2@56 r16@60
;
; Register computations (from r8 = frame counter):
;   r1  = r8 * 2        (double)
;   r10  = r8 * 3        (triple)
;   r9  = r8 * 4        (quadruple)
;   r15  = r8 & 255      (low byte)
;   r6  = r8 * r8       (square)
;   r14  = r8 XOR 0xAAAA (pseudo-random)
;   r11  = r8 << 4       (shifted)
;   r12  = -r8           (negated)
;   r5 = r8 % 17       (modular)
;   r3 = r15 + r6       (sum)
;   r0 = r6 >> 8       (upper square)
;   r7 = r8 | 0x0F0F   (bitmask)
;   r13 = r14 & r11       (combination)
;   r2 = r8 + r12       (zero: r8 + NEG(r8))
;   r16 = r11 - r8       (r8 * 15)

  LDI r30, 0xFF00      ; Stack pointer for CALL/RET
  LDI r20, 10          ; Divisor constant
  LDI r21, 48          ; ASCII '0'
  LDI r22, 1           ; Increment constant

main_loop:
  ; === Update register values ===
  ADD r8, r22           ; r8 = frame counter (1, 2, 3, ...)

  MOV r1, r8            ; r1 = r8 * 2
  ADD r1, r8

  MOV r10, r1            ; r10 = r8 * 3
  ADD r10, r8

  MOV r9, r1            ; r9 = r8 * 4
  ADD r9, r1

  MOV r15, r8            ; r15 = r8 & 0xFF (low byte)
  LDI r23, 255
  AND r15, r23

  MOV r6, r8            ; r6 = r8 * r8 (square)
  MUL r6, r8

  MOV r14, r8            ; r14 = r8 XOR 0xAAAA
  LDI r23, 43690
  XOR r14, r23

  MOV r11, r8            ; r11 = r8 << 4
  LDI r23, 4
  SHL r11, r23

  MOV r12, r8            ; r12 = -r8 (negated)
  NEG r12

  MOV r5, r8           ; r5 = r8 % 17
  LDI r23, 17
  MOD r5, r23

  MOV r3, r15           ; r3 = r15 + r6
  ADD r3, r6

  MOV r0, r6           ; r0 = r6 >> 8
  LDI r23, 8
  SHR r0, r23

  MOV r7, r8           ; r7 = r8 | 0x0F0F
  LDI r23, 3855
  OR r7, r23

  MOV r13, r14           ; r13 = r14 & r11
  AND r13, r11

  MOV r2, r8           ; r2 = r8 + r12 = 0
  ADD r2, r12

  MOV r16, r11           ; r16 = r11 - r8 = r8*15
  SUB r16, r8

  ; === Display registers to canvas ===
  ; Row 0 (canvas indices 0-31)
  LDI r25, 0x8000
  MOV r26, r8
  CALL write_digits

  LDI r25, 0x8004
  MOV r26, r1
  CALL write_digits

  LDI r25, 0x8008
  MOV r26, r10
  CALL write_digits

  LDI r25, 0x800C
  MOV r26, r9
  CALL write_digits

  LDI r25, 0x8010
  MOV r26, r15
  CALL write_digits

  LDI r25, 0x8014
  MOV r26, r6
  CALL write_digits

  LDI r25, 0x8018
  MOV r26, r14
  CALL write_digits

  LDI r25, 0x801C
  MOV r26, r11
  CALL write_digits

  ; Row 1 (canvas indices 32-63)
  LDI r25, 0x8020
  MOV r26, r12
  CALL write_digits

  LDI r25, 0x8024
  MOV r26, r5
  CALL write_digits

  LDI r25, 0x8028
  MOV r26, r3
  CALL write_digits

  LDI r25, 0x802C
  MOV r26, r0
  CALL write_digits

  LDI r25, 0x8030
  MOV r26, r7
  CALL write_digits

  LDI r25, 0x8034
  MOV r26, r13
  CALL write_digits

  LDI r25, 0x8038
  MOV r26, r2
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
