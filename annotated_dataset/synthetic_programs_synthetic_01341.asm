; DESCRIPTION: This GeOS assembly code initializes several registers and enters a loop where it multiplies two registers (`r6 = r10 * r12`), checks key inputs (`IKEY r5`, `IKEY r1`, `IKEY r9`), performs bitwise operations (`AND`, `XOR`), compares values, and conditionally jumps based on the results. The loop continues indefinitely (`JMP main_0`).

; drawing loop program
; initialization
  LDI r12, 4
  LDI r13, 1291
  LDI r11, 8
  LDI r14, 0x4F7AC7
  LDI r5, 256
  LDI r18, 2372
main_0:
  MUL r6, r10, r12
  IKEY r5
  CMPI r5, 128
  JNZ r5, key_1
  AND r13, r10, r11
  AND r12, r0, r14
  XOR r15, r12, r2
  IKEY r1
  CMPI r1, 71
  JNZ r1, key_2
  IKEY r9
  CMPI r9, 142
  JNZ r9, key_3
  CMPI r5, r11, 0x918902
  FRAME
  JMP main_0
