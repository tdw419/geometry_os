; DESCRIPTION: Draws a green rectangle at (153, 87) with width 99 and height 81.
; PLAN: r0=153(x), r1=87(y), r2=99(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 87
LDI r2, 99
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
