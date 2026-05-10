; DESCRIPTION: Draws a green rectangle at (133, 153) with width 79 and height 59.
; PLAN: r0=133(x), r1=153(y), r2=79(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 153
LDI r2, 79
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
