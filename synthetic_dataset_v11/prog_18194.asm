; DESCRIPTION: Draws a purple rectangle at (151, 71) with width 29 and height 82.
; PLAN: r0=151(x), r1=71(y), r2=29(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 71
LDI r2, 29
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
