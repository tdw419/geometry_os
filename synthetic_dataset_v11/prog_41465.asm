; DESCRIPTION: Draws a purple rectangle at (170, 72) with width 38 and height 93.
; PLAN: r0=170(x), r1=72(y), r2=38(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 72
LDI r2, 38
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
