; DESCRIPTION: The GeOS assembly code initializes several registers and then enters a loop where it performs bitwise operations, shifts, and conditional checks. It draws lines on the screen using the `LINE` instruction and waits for a specific key press (`0x6B8E02`) to trigger a full-screen refresh with the `FRAME` command before repeating the loop.

; drawing loop program
; initialization
  LDI r0, 1693
  LDI r6, 4
  LDI r4, 2570
  LDI r8, 2288
main_0:
  AND r14, r12, r3
  OR r2, r13, r12
  XOR r1, r3, r8
  SAR r2, r9, r8
  SAR r12, r24, r15
  LDI r1, 128
  LDI r4, 0
  LDI r9, 3862
  LDI r0, 0
  LDI r12, 3264
  LINE r1, r4, r9, r0, r12
  IKEY r22
  CMPI r22, 0x6B8E02
  JNZ r22, key_1
  FRAME
  JMP main_0
