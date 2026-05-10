; DESCRIPTION: Draws a purple rectangle at (324, 116) with width 57 and height 59.
; PLAN: r0=324(x), r1=116(y), r2=57(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 116
LDI r2, 57
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
