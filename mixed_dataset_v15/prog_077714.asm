; DESCRIPTION: Draws a purple rectangle at (291, 133) with width 74 and height 54.
; PLAN: r0=291(x), r1=133(y), r2=74(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 133
LDI r2, 74
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
