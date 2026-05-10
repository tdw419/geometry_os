; DESCRIPTION: Draws a yellow rectangle at (193, 20) with width 88 and height 49.
; PLAN: r0=193(x), r1=20(y), r2=88(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 20
LDI r2, 88
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
