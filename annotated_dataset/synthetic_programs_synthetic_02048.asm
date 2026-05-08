; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and enters an infinite loop where it performs a series of bitwise operations including shifts (SHL, SHLI, SHR, SAR), logical operations (XOR, OR, AND), and a function call (FRAME). The loop continuously manipulates the register values without affecting external memory or peripherals.

; drawing loop program
; initialization
  LDI r1, 64
  LDI r14, 128
  LDI r6, 0x77C2DE
  LDI r4, 128
  LDI r5, 2776
  LDI r10, 0x47F915
  LDI r2, 4
main_0:
  SHL r0, r12, r9
  XOR r9, r3, r12
  OR r7, r8, r1
  XOR r0, r7, r14
  AND r4, r11, r6
  SHLI r8, r13, 7
  SAR r5, r9, r11
  SAR r13, r12, r7
  SHR r2, r14, r4
  SAR r8, r13, r25
  SAR r14, r11, r5
  SAR r0, r5, r4
  FRAME
  JMP main_0
