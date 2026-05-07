; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a drawing loop. It waits for a key press, checks if the pressed key is 'z' (ASCII value 126), and if so, it draws a frame if a condition involving register `r11` is met, then loops back to wait for another key press.

; drawing loop program
; initialization
  LDI r9, 128
  LDI r10, 0x14F134
  LDI r13, 2
  LDI r1, 4
  LDI r0, 2426
  LDI r14, 3691
  LDI r15, 86
main_0:
  IKEY r3
  CMPI r3, 126
  JNZ r3, key_1
  CMPI r11, 156
  FRAME
  JMP main_0
