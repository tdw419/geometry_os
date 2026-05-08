; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then performs geometric drawing operations including drawing a line and filling a rectangle on the screen. The program halts execution after completing these tasks.

; simple draw program
; initialization
  LDI r3, 0x718EAA
  LDI r6, 0x1D63F4
  LDI r0, 255
  LDI r14, 0x67C6C8
  LDI r6, 10
  LDI r3, 0x79582A
  LDI r14, 2997
  LDI r24, 0xED69DA
  LDI r10, 1364
  LINE r6, r3, r14, r24, r10
  LDI r13, 1336
  LDI r11, 2292
  LDI r4, 8
  WPIXEL
  LDI r7, 0x906B54
  LDI r7, 2431
  LDI r2, 0x6A3197
  LDI r1, 32
  LDI r14, 1051
  RECTF r7, r7, r2, r1, r14
  HALT
