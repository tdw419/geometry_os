; DESCRIPTION: Draws a green rectangle at (247, 52) with width 106 and height 113.
; PLAN: r0=247(x), r1=52(y), r2=106(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 52
LDI r2, 106
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
