; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a drawing loop where it performs bitwise operations, logical operations, arithmetic multiplication, and uses the `PSET` instruction to plot pixels on a screen. The loop continues indefinitely, repeatedly updating pixel positions and colors based on the calculated values.

; drawing loop program
; initialization
  LDI r5, 2038
  LDI r8, 128
  LDI r11, 256
  LDI r2, 0x6087AF
  LDI r0, 1480
  LDI r6, 256
  LDI r1, 0x4D02CE
  LDI r24, 3639
main_0:
  XOR r4, r10, r13
  XOR r14, r1, r9
  AND r15, r0, r5
  OR r10, r9, r21
  AND r12, r2, r6
  AND r4, r8, r3
  XOR r4, r11, r2
  AND r11, r6, r14
  XOR r5, r12, r6
  XOR r9, r4, r3
  XOR r5, r0, r12
  XOR r15, r1, r12
  MUL r6, r3, r11
  LDI r1, 2103
  LDI r14, 32
  LDI r10, 2096
  PSET r1, r14, r10
  FRAME
  JMP main_0
