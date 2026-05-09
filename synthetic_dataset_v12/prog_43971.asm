; DESCRIPTION: Draws a purple rectangle at (69, 83) with width 24 and height 59.
; PLAN: r0=69(x), r1=83(y), r2=24(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 83
LDI r2, 24
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
