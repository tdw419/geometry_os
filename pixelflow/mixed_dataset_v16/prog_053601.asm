; DESCRIPTION: Draws a green rectangle at (338, 46) with width 110 and height 40.
; PLAN: r0=338(x), r1=46(y), r2=110(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 46
LDI r2, 110
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
