; DESCRIPTION: Draws a purple rectangle at (95, 96) with width 36 and height 90.
; PLAN: r0=95(x), r1=96(y), r2=36(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 96
LDI r2, 36
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
