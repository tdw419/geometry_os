; DESCRIPTION: Draws a purple rectangle at (115, 159) with width 69 and height 59.
; PLAN: r0=115(x), r1=159(y), r2=69(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 159
LDI r2, 69
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
