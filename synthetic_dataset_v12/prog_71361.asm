; DESCRIPTION: Draws a purple rectangle at (285, 134) with width 74 and height 34.
; PLAN: r0=285(x), r1=134(y), r2=74(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 134
LDI r2, 74
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
