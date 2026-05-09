; DESCRIPTION: Draws a purple rectangle at (38, 10) with width 17 and height 92.
; PLAN: r0=38(x), r1=10(y), r2=17(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 10
LDI r2, 17
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
