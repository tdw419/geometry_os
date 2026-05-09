; DESCRIPTION: Draws a purple rectangle at (100, 46) with width 24 and height 53.
; PLAN: r0=100(x), r1=46(y), r2=24(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 46
LDI r2, 24
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
