; DESCRIPTION: Draws a purple rectangle at (82, 89) with width 18 and height 108.
; PLAN: r0=82(x), r1=89(y), r2=18(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 89
LDI r2, 18
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
