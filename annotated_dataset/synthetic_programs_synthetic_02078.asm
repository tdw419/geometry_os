; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a loop where it performs bit shifting, arithmetic operations, and conditional checks. The program continuously waits for a key input; if the key 'F' (ASCII 70) is pressed, it calls the `FRAME` function and restarts the loop.

; drawing loop program
; initialization
  LDI r19, 1677
  LDI r9, 4013
  LDI r8, 1237
main_0:
  SHLI r3, r14, 10
  SHR r4, r5, r12
  SHLI r14, r7, 0
  SAR r8, r3, r1
  AND r15, r3, r20
  AND r2, r3, r1
  XOR r4, r12, r0
  MUL r3, r14, r11
  IKEY r5
  CMPI r5, 70
  JNZ r5, key_1
  FRAME
  JMP main_0
