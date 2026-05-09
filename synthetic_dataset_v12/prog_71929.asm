; DESCRIPTION: Draws a blue rectangle at (221, 106) with width 13 and height 31.
; PLAN: r0=221(x), r1=106(y), r2=13(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 106
LDI r2, 13
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
