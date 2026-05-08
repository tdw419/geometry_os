; DESCRIPTION: The provided GeOS assembly code initializes various registers with specific values and sets up a color palette. It then performs arithmetic operations such as division, multiplication, and bitwise shifts. Depending on the comparison results, it either modifies register values or executes a series of drawing commands, including setting pixels and filling areas with colors. The program halts execution after these operations.

; mixed program
; initialization
  LDI r9, 2
  LDI r13, 128
  LDI r7, 2812
  LDI r14, 0x98A058
  LDI r2, 64
  LDI r11, 0x6FECFA
  LDI r6, 0xEC8C70
  LDI r1, 0x6528AD
; palette
  LDI r12, 0x20AE
  LDI r13, 1
  LDI r5, 0xFFEE00
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0xFF4400
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0x00FFAA
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0xDD0044
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0xFF4400
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0x888800
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0x00AAFF
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0x008888
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0x00AAFF
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0x0000CC
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0x00FFAA
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0x0044FF
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0xAA00AA
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0xFFAA00
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0xFFAA00
  STORE r12, r5
  ADD r12, r12, r13
  MOD r0, r10, r14
  CMP r3, r15
  JNZ r3, else_0
  DIV r7, r0, r1
  SHR r13, r12, r2
  MUL r12, r6, r0
  JMP endif_1
else_0:
  LDI r9, 1
  LDI r12, 64
  LDI r15, 3004
  PSET r9, r12, r15
endif_1:
  IKEY r12
  CMPI r12, 0x812D67
  JNZ r12, key_2
  LDI r9, 0x963463
  LDI r16, 0x257311
  LDI r11, 0x08386F
  WPIXEL
  LDI r8, 0xB09346
  FILL r8
  SHLI r14, r6, 0
  SHR r7, r15, r4
  SAR r7, r2, r4
  HALT
