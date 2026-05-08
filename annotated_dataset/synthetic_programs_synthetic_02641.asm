; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it performs bitwise operations (OR, XOR, SHR, SHL), compares two registers, and calls the TEXT function to display "HELLO". The loop continues indefinitely due to the JMP instruction.

; input driven program
; initialization
  LDI r14, 128
  LDI r12, 2
  LDI r10, 0xA1419B
  LDI r7, 1154
  LDI r6, 32
  LDI r15, 2066
main_0:
  OR r13, r4, r14
  XOR r19, r3, r11
  XOR r13, r8, r3
  SHR r15, r0, r10
  SHR r8, r11, r1
  SHL r5, r9, r11
  LDI r15, 196
  LDI r13, 1505
  LDI r13, 0x21DD46
  TEXT r15, r13, r13, "HELLO"
  CMP r20, r15
  FRAME
  JMP main_0
