; DESCRIPTION: Draws a purple rectangle at (50, 38) with width 55 and height 43.
; PLAN: r0=50(x), r1=38(y), r2=55(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 38
LDI r2, 55
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
