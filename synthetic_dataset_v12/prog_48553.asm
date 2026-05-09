; DESCRIPTION: Draws a purple rectangle at (236, 40) with width 95 and height 37.
; PLAN: r0=236(x), r1=40(y), r2=95(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 40
LDI r2, 95
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
