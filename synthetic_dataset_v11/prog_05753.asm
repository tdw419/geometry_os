; DESCRIPTION: Draws a purple rectangle at (202, 95) with width 29 and height 96.
; PLAN: r0=202(x), r1=95(y), r2=29(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 95
LDI r2, 29
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
