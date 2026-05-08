; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs a series of arithmetic, logical, and shift operations, including multiplication, subtraction, XOR, AND, OR, SHL, SHLI, SHR, SAR, and comparisons. The code halts execution at the end.

; math computation
; initialization
  LDI r10, 10
  LDI r6, 2646
  LDI r2, 2035
  LDI r0, 2633
  LDI r13, 0x410490
  LDI r4, 670
  LDI r16, 0xAE9E71
  CMPI r8, r12, 0xDA8BB6
  SUBI r12, r2, 65
  SHLI r7, r1, 0x41C3C1
  SHLI r8, r6, 4
  SAR r6, r28, r14
  SHL r7, r11, r15
  SHL r6, r8, r15
  MUL r3, r15, r10
  XOR r14, r13, r9
  XOR r8, r15, r7
  AND r12, r5, r6
  SUBI r8, r2, 16
  ANDI r9, r8, 18
  ADDI r9, r1, 27
  SAR r11, r1, r27
  SHLI r7, r8, 2
  XOR r13, r0, r14
  SAR r9, r1, r5
  SHR r9, r13, r11
  SHL r29, r7, r9
  SHR r10, r4, r3
  XOR r2, r8, r3
  OR r9, r2, r10
  SHLI r15, r5, 0xBC873A
  SHLI r7, r8, 2
  SAR r2, r0, r6
  HALT
