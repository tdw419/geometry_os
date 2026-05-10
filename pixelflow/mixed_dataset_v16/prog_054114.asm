; DESCRIPTION: Draws a purple rectangle at (117, 2) with width 24 and height 50.
; PLAN: r0=117(x), r1=2(y), r2=24(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 2
LDI r2, 24
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
