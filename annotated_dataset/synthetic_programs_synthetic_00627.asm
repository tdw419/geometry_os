; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a drawing loop. It shifts bits in register `r8` based on the value in `r2`, checks for a key press (specifically if the key '2' is pressed), and then calls the `FRAME` function to update the display, repeating indefinitely until another condition changes execution flow.

; drawing loop program
; initialization
  LDI r7, 0x0E3EF6
  LDI r14, 2300
  LDI r11, 255
  LDI r1, 0x67B01D
  LDI r15, 0x7D5C36
main_0:
  SHL r8, r1, r2
  IKEY r15
  CMPI r15, 2
  JNZ r15, key_1
  FRAME
  JMP main_0
