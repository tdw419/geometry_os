; DESCRIPTION: Draws a purple rectangle at (194, 28) with width 59 and height 53.
; PLAN: r0=194(x), r1=28(y), r2=59(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 28
LDI r2, 59
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
