; DESCRIPTION: Draws a purple rectangle at (145, 14) with width 27 and height 91.
; PLAN: r0=145(x), r1=14(y), r2=27(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 14
LDI r2, 27
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
