; DESCRIPTION: Draws a green rectangle at (49, 77) with width 105 and height 40.
; PLAN: r0=49(x), r1=77(y), r2=105(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 77
LDI r2, 105
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
