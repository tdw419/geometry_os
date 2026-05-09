; DESCRIPTION: Draws a purple rectangle at (453, 207) with width 19 and height 27.
; PLAN: r0=453(x), r1=207(y), r2=19(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 207
LDI r2, 19
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
