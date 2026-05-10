; DESCRIPTION: Draws a yellow rectangle at (336, 143) with width 36 and height 88.
; PLAN: r0=336(x), r1=143(y), r2=36(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 143
LDI r2, 36
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
