; DESCRIPTION: This GeOS assembly code initializes various registers and enters a loop where it repeatedly fills memory at address 3388 with data, displays the text "HELLO" in a frame, and then jumps back to the start of the loop. The program is designed to run indefinitely, continuously displaying the message.

; input driven program
; initialization
  LDI r6, 1740
  LDI r1, 256
  LDI r11, 2
  LDI r9, 64
  LDI r15, 256
main_0:
  LDI r10, 3388
  FILL r10
  LDI r3, 8
  LDI r4, 64
  LDI r13, 255
  TEXT r3, r4, r13, "HELLO"
  FRAME
  JMP main_0
