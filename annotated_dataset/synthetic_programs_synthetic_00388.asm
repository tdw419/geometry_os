; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it checks for a key press (value 4). If the key is pressed, it calls the `FRAME` function to draw something on the screen. The loop continues indefinitely until a different key is detected.

; drawing loop program
; initialization
  LDI r3, 0xA6EE76
  LDI r0, 256
  LDI r8, 64
  LDI r6, 0xBA8828
  LDI r13, 2097
  LDI r7, 0xECA878
main_0:
  CMPI r3, 0xC07501
  IKEY r2
  CMPI r2, 4
  JNZ r2, key_1
  FRAME
  JMP main_0
