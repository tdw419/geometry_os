; DESCRIPTION: This GeOS assembly code initializes registers and enters an infinite loop where it performs bitwise operations, arithmetic multiplications, and logical ORs. It then loads specific values into registers and uses them to draw a text string "HELLO" on the screen repeatedly.

; drawing loop program
; initialization
  LDI r5, 2752
  LDI r12, 2
  LDI r15, 2
main_0:
  ANDI r7, r27, 4
  MUL r6, r5, r2
  OR r9, r2, r8
  AND r9, r0, r21
  LDI r5, 584
  LDI r15, 10
  LDI r3, 1059
  TEXT r5, r15, r3, "HELLO"
  FRAME
  JMP main_0
