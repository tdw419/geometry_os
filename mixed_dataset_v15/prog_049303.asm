; DESCRIPTION: Draws a green rectangle at (270, 8) with width 77 and height 73.
; PLAN: r0=270(x), r1=8(y), r2=77(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 8
LDI r2, 77
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
