; DESCRIPTION: Draws a green rectangle at (74, 97) with width 106 and height 48.
; PLAN: r0=74(x), r1=97(y), r2=106(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 97
LDI r2, 106
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
