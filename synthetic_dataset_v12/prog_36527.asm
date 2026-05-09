; DESCRIPTION: Draws a purple rectangle at (66, 134) with width 103 and height 101.
; PLAN: r0=66(x), r1=134(y), r2=103(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 134
LDI r2, 103
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
