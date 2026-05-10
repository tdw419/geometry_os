; DESCRIPTION: Draws a purple rectangle at (187, 12) with width 51 and height 80.
; PLAN: r0=187(x), r1=12(y), r2=51(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 12
LDI r2, 51
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
