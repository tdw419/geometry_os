; DESCRIPTION: Draws a purple rectangle at (82, 46) with width 35 and height 75.
; PLAN: r0=82(x), r1=46(y), r2=35(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 46
LDI r2, 35
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
