; DESCRIPTION: Draws a yellow rectangle at (81, 78) with width 52 and height 30.
; PLAN: r0=81(x), r1=78(y), r2=52(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 78
LDI r2, 52
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
