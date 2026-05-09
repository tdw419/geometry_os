; DESCRIPTION: Draws a purple rectangle at (443, 118) with width 26 and height 101.
; PLAN: r0=443(x), r1=118(y), r2=26(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 118
LDI r2, 26
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
