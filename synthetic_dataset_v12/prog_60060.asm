; DESCRIPTION: Draws a purple rectangle at (52, 69) with width 44 and height 50.
; PLAN: r0=52(x), r1=69(y), r2=44(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 69
LDI r2, 44
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
