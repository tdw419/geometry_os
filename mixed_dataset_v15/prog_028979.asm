; DESCRIPTION: Draws a purple rectangle at (81, 175) with width 82 and height 82.
; PLAN: r0=81(x), r1=175(y), r2=82(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 175
LDI r2, 82
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
