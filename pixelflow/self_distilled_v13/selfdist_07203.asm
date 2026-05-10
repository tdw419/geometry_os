; DESCRIPTION: Draws a green rectangle at (30, 19) with width 25 and height 77.
; PLAN: r0=30(x), r1=19(y), r2=25(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 19
LDI r2, 25
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
