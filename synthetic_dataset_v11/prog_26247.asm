; DESCRIPTION: Draws a purple rectangle at (8, 71) with width 98 and height 72.
; PLAN: r0=8(x), r1=71(y), r2=98(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 71
LDI r2, 98
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
