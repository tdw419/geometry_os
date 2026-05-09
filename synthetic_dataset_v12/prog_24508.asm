; DESCRIPTION: Draws a purple rectangle at (258, 177) with width 90 and height 10.
; PLAN: r0=258(x), r1=177(y), r2=90(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 177
LDI r2, 90
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
