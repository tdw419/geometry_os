; DESCRIPTION: Draws a purple rectangle at (93, 122) with width 98 and height 27.
; PLAN: r0=93(x), r1=122(y), r2=98(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 122
LDI r2, 98
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
