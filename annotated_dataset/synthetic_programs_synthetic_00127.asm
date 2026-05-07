; DESCRIPTION: This GeOS assembly code initializes registers with specific values and sets up a color palette. It then conditionally executes either a circle drawing routine or sets up text parameters before halting.

; mixed program
; initialization
  LDI r8, 0xDC901D
  LDI r4, 0xEF3DD0
; palette
  LDI r5, 0x8084
  LDI r13, 1
  LDI r0, 0x000066
  STORE r5, r0
  ADD r5, r5, r13
  LDI r0, 0x0044FF
  STORE r5, r0
  ADD r5, r5, r13
  LDI r0, 0x0000CC
  STORE r5, r0
  ADD r5, r5, r13
  LDI r0, 0x0044FF
  STORE r5, r0
  ADD r5, r5, r13
  LDI r0, 0x00FFAA
  STORE r5, r0
  ADD r5, r5, r13
  CMP r14, r3
  JZ r14, else_0
  ADD r9, r0, r2
  OR r8, r4, r3
  AND r11, r7, r14
  OR r0, r1, r8
  JMP endif_1
else_0:
  LDI r15, 1473
  LDI r12, 16
  LDI r2, 4093
  LDI r8, 3469
  CIRCLE r15, r12, r2, r8
endif_1:
  LDI r4, 3908
  LDI r1, 0xB59389
  LDI r3, 0x2D479C
  DRAWTEXT r4, r1, r3, "WORLD"
  SAR r15, r7, r9
  SHR r12, r14, r1
  HALT
