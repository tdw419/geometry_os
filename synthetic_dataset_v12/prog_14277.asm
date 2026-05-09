; DESCRIPTION: Draws a purple rectangle at (23, 38) with width 116 and height 93.
; PLAN: r0=23(x), r1=38(y), r2=116(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 38
LDI r2, 116
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
