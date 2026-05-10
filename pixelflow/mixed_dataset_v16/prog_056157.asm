; DESCRIPTION: Draws a purple rectangle at (221, 73) with width 36 and height 10.
; PLAN: r0=221(x), r1=73(y), r2=36(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 73
LDI r2, 36
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
