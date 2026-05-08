; DESCRIPTION: This GeOS assembly code initializes registers and enters an infinite loop where it performs bitwise operations, loads specific values into registers, displays text using the `TEXT` command, shifts bits in a register, and repeatedly calls a subroutine to update the display. The loop continuously processes these operations without termination.

; drawing loop program
; initialization
  LDI r5, 249
  LDI r0, 1368
main_0:
  XOR r3, r0, r10
  XOR r25, r1, r3
  LDI r12, 0xF5E186
  LDI r12, 3919
  LDI r9, 0xC70971
  TEXT r12, r12, r9, "HELLO"
  SHL r2, r15, r5
  FRAME
  JMP main_0
