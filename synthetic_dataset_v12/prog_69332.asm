; DESCRIPTION: Draws a purple rectangle at (366, 111) with width 95 and height 115.
; PLAN: r0=366(x), r1=111(y), r2=95(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 111
LDI r2, 95
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
