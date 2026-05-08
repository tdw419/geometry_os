; DESCRIPTION: This GeOS assembly code initializes several registers and then uses geometric drawing functions to fill a rectangle with color `0x2A892F`, draw a line from the origin (0,0) to point (854,128) in color `0xFBA546`, and finally draw a circle centered at (3352,8) with radius 1562 in color `0x8F9092`. The program halts after completing these drawing operations.

; simple draw program
; initialization
  LDI r8, 16
  LDI r9, 0x4F30A1
  LDI r6, 0
  LDI r0, 1
  LDI r10, 0x2A892F
  FILL r10
  LDI r16, 0
  LDI r12, 0
  LDI r10, 0xFBA546
  LDI r0, 854
  LDI r6, 128
  LINE r16, r12, r10, r0, r6
  LDI r10, 3352
  LDI r13, 8
  LDI r8, 1562
  LDI r11, 0x8F9092
  CIRCLE r10, r13, r8, r11
  HALT
