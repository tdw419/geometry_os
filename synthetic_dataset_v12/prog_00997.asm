; DESCRIPTION: Draws a purple rectangle at (278, 17) with width 58 and height 108.
; PLAN: r0=278(x), r1=17(y), r2=58(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 17
LDI r2, 58
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
