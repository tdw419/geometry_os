; DESCRIPTION: Draws a purple rectangle at (345, 55) with width 49 and height 59.
; PLAN: r0=345(x), r1=55(y), r2=49(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 55
LDI r2, 49
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
