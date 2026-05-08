; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs a series of shift operations on these registers, and finally executes a pixel set instruction before halting. The operations involve loading and storing data between registers and memory addresses, as well as shifting bits left and right.

; mixed program
; initialization
  LDI r0, 0x5EF974
  LDI r1, 766
  LDI r2, 1659
  LDI r7, 1828
  LDI r4, 765
  LDI r10, 37
  LDI r11, 0x3980ED
  LDI r15, 2046
  LDI r6, 0xBB67ED
  STORE r6, r15
  LOAD r0, r6
  LDI r15, 1292
  STORE r15, r8
  LOAD r0, r15
  LDI r15, 2812
  STORE r15, r11
  LOAD r10, r15
  SHR r30, r3, r1
  SHL r11, r12, r0
  SHLI r11, r0, 0xFA9EAB
  SHL r7, r14, r16
  LDI r7, 3334
  LDI r12, 0xD9EDD8
  LDI r2, 322
  PSETI
  HALT
