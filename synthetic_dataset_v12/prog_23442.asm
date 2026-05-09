; DESCRIPTION: Draws a purple rectangle at (91, 24) with width 56 and height 95.
; PLAN: r0=91(x), r1=24(y), r2=56(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 24
LDI r2, 56
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
