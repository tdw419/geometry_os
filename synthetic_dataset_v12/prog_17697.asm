; DESCRIPTION: Draws a purple rectangle at (198, 20) with width 43 and height 108.
; PLAN: r0=198(x), r1=20(y), r2=43(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 20
LDI r2, 43
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
