; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a loop where it waits for a key press. If the key pressed is not 256, it shifts a value in register `r11` by the contents of `r2` and `r8`, then calls a function using `FRAME`. The program continues to loop back to wait for another key press.

; input driven program
; initialization
  LDI r1, 0xE4C922
  LDI r7, 3300
  LDI r5, 243
main_0:
  IKEY r1
  CMPI r1, 256
  JNZ r1, key_1
  SHR r11, r2, r8
  FRAME
  JMP main_0
