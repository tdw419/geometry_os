; DESCRIPTION: Draws a yellow rectangle at (266, 133) with width 36 and height 19.
; PLAN: r0=266(x), r1=133(y), r2=36(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 133
LDI r2, 36
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
