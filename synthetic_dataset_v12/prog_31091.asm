; DESCRIPTION: Draws a purple rectangle at (18, 31) with width 19 and height 50.
; PLAN: r0=18(x), r1=31(y), r2=19(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 31
LDI r2, 19
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
