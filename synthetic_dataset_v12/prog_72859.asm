; DESCRIPTION: Draws a purple rectangle at (81, 160) with width 38 and height 82.
; PLAN: r0=81(x), r1=160(y), r2=38(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 160
LDI r2, 38
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
