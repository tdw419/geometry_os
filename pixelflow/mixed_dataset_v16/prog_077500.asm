; DESCRIPTION: Draws a purple rectangle at (304, 25) with width 90 and height 119.
; PLAN: r0=304(x), r1=25(y), r2=90(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 25
LDI r2, 90
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
