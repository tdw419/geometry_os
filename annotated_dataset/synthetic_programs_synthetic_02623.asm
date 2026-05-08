; DESCRIPTION: This GeOS assembly code initializes registers and sets up a loop that displays the text "HELLO" at memory address 2900 using register values. It then waits for user input; if the input is '2', it calls the `FRAME` function before repeating the loop.

; input driven program
; initialization
  LDI r8, 2000
  LDI r0, 255
main_0:
  LDI r11, 2900
  LDI r3, 32
  LDI r8, 256
  TEXT r11, r3, r8, "HELLO"
  IKEY r0
  CMPI r0, 2
  JNZ r0, key_1
  FRAME
  JMP main_0
