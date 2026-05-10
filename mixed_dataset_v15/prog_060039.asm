; DESCRIPTION: Draws a purple rectangle at (7, 90) with width 27 and height 112.
; PLAN: r0=7(x), r1=90(y), r2=27(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 90
LDI r2, 27
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
