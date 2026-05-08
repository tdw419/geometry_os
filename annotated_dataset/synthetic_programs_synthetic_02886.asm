; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and then draws a line using the LINE command followed by filling the screen with a color using the FILL command. It ends by writing a pixel at a specified location and halting execution.

; simple draw program
; initialization
  LDI r28, 1
  LDI r4, 255
  LDI r9, 2349
  LDI r14, 0x1D2E2E
  LDI r12, 0xCB7F11
  LDI r1, 2
  LDI r0, 0xBCE4B8
  LDI r13, 0x28B9F5
  LDI r3, 8
  LDI r3, 0x14A5EE
  LDI r3, 2269
  LDI r10, 2661
  LINE r13, r3, r3, r3, r10
  LDI r11, 0xA5D10D
  FILL r11
  LDI r11, 2
  LDI r7, 256
  LDI r3, 0
  WPIXEL
  HALT
