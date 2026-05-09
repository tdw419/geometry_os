; DESCRIPTION: Draws a purple rectangle at (39, 5) with width 24 and height 100.
; PLAN: r0=39(x), r1=5(y), r2=24(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 5
LDI r2, 24
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
