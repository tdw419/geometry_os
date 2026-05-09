; DESCRIPTION: Draws a purple rectangle at (95, 31) with width 100 and height 50.
; PLAN: r0=95(x), r1=31(y), r2=100(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 31
LDI r2, 100
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
