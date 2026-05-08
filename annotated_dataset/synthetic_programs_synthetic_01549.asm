; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a loop where it checks if the value in `r10` is less than 140. Inside the loop, it performs arithmetic operations including addition, bitwise AND, and modulo, followed by a conditional check on user input. If the input matches a specific key value, it calls a function to draw a frame; otherwise, it continues the loop.

; drawing loop program
; initialization
  LDI r3, 280
  LDI r14, 0xA086E0
  LDI r9, 16
  LDI r2, 718
main_0:
  CMPI r10, 140
  ADDI r6, r4, 0xBDDB47
  AND r3, r6, r1
  MOD r2, r3, r12
  IKEY r0
  CMPI r0, 0xBDC725
  JNZ r0, key_1
  FRAME
  JMP main_0
