; DESCRIPTION: Draws a green rectangle at (247, 9) with width 18 and height 15.
; PLAN: r0=247(x), r1=9(y), r2=18(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 9
LDI r2, 18
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
