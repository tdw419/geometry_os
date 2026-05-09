; DESCRIPTION: Draws a purple rectangle at (101, 149) with width 67 and height 61.
; PLAN: r0=101(x), r1=149(y), r2=67(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 149
LDI r2, 67
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
