; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and then performs geometric drawing operations including drawing a circle and setting pixels on the screen. The program sets up color and position parameters before executing these operations and finally halts execution.

; simple draw program
; initialization
  LDI r4, 0xCDB674
  LDI r1, 0x406D3F
  LDI r7, 0x3075C4
  LDI r13, 256
  LDI r0, 2748
  LDI r9, 8
  LDI r15, 0
  LDI r12, 637
  LDI r8, 4
  LDI r12, 10
  LDI r14, 4
  LDI r9, 0x80AD3C
  CIRCLE r8, r12, r14, r9
  LDI r10, 0x9FB5E1
  LDI r13, 2
  LDI r15, 0x5625DC
  PSET r10, r13, r15
  LDI r7, 0
  LDI r9, 3592
  LDI r14, 256
  PSET r7, r9, r14
  HALT
