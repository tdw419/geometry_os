; DESCRIPTION: Draws a purple rectangle at (23, 4) with width 116 and height 59.
; PLAN: r0=23(x), r1=4(y), r2=116(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 4
LDI r2, 116
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
