; DESCRIPTION: This GeOS assembly code initializes several registers and then enters a loop where it draws a rectangle using the `RECTF` instruction. The program waits for a key press using `IKEY`, checks if the pressed key is not equal to 256 with `CMPI` and `JNZ`. If the condition is met, it calls `FRAME` to update the display and then jumps back to the start of the loop (`main_0`).

; input driven program
; initialization
  LDI r12, 0
  LDI r1, 3637
  LDI r11, 128
  LDI r15, 2502
  LDI r2, 1
  LDI r9, 1
  LDI r5, 3925
  LDI r27, 3390
main_0:
  LDI r5, 32
  LDI r0, 2847
  LDI r13, 1899
  LDI r1, 128
  LDI r24, 8
  RECTF r5, r0, r13, r1, r24
  IKEY r9
  CMPI r9, 256
  JNZ r9, key_1
  FRAME
  JMP main_0
