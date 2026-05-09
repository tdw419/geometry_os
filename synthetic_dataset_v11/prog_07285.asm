; DESCRIPTION: Draws a yellow rectangle at (30, 78) with width 102 and height 52.
; PLAN: r0=30(x), r1=78(y), r2=102(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 78
LDI r2, 102
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
