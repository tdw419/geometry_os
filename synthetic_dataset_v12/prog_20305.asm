; DESCRIPTION: Draws a purple rectangle at (48, 117) with width 35 and height 66.
; PLAN: r0=48(x), r1=117(y), r2=35(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 117
LDI r2, 35
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
