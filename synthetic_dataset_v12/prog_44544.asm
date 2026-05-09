; DESCRIPTION: Draws a purple rectangle at (93, 162) with width 59 and height 67.
; PLAN: r0=93(x), r1=162(y), r2=59(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 162
LDI r2, 59
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
