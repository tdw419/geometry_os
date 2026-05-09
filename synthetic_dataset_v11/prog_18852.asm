; DESCRIPTION: Draws a green rectangle at (25, 176) with width 112 and height 77.
; PLAN: r0=25(x), r1=176(y), r2=112(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 176
LDI r2, 112
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
