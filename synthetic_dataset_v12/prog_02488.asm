; DESCRIPTION: Draws a purple rectangle at (54, 82) with width 15 and height 71.
; PLAN: r0=54(x), r1=82(y), r2=15(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 82
LDI r2, 15
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
