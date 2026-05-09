; DESCRIPTION: Draws a purple rectangle at (81, 159) with width 83 and height 72.
; PLAN: r0=81(x), r1=159(y), r2=83(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 159
LDI r2, 83
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
