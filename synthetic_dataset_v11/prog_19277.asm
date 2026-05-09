; DESCRIPTION: Draws a yellow rectangle at (76, 15) with width 120 and height 84.
; PLAN: r0=76(x), r1=15(y), r2=120(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 15
LDI r2, 120
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
