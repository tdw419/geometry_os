; DESCRIPTION: This GeOS assembly code initializes two registers, enters a loop where it compares values in registers and shifts bits, loads new values into registers, prints the string "HELLO" to the screen at a specific position, and then jumps back to the start of the loop. The program is input-driven and continuously executes its main loop.

; input driven program
; initialization
  LDI r2, 1264
  LDI r7, 1013
main_0:
  CMP r8, r3
  CMPI r4, 256
  SHL r15, r1, r9
  LDI r2, 2355
  LDI r4, 1119
  LDI r15, 0x05E7FC
  TEXT r2, r4, r15, "HELLO"
  FRAME
  JMP main_0
