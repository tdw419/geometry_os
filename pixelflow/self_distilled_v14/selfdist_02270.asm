; DESCRIPTION: Draws a purple rectangle at (108, 53) with width 89 and height 30.
; PLAN: r0=108(x), r1=53(y), r2=89(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 53
LDI r2, 89
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
