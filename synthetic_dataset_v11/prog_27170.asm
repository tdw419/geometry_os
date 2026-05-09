; DESCRIPTION: Draws a yellow rectangle at (62, 135) with width 52 and height 76.
; PLAN: r0=62(x), r1=135(y), r2=52(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 135
LDI r2, 52
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
