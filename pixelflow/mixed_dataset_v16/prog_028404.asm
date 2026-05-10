; DESCRIPTION: Draws a yellow rectangle at (88, 133) with width 81 and height 56.
; PLAN: r0=88(x), r1=133(y), r2=81(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 133
LDI r2, 81
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
