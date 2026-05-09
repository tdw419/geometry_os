; DESCRIPTION: Draws a purple rectangle at (419, 29) with width 61 and height 71.
; PLAN: r0=419(x), r1=29(y), r2=61(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 29
LDI r2, 61
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
