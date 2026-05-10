; DESCRIPTION: Draws a purple rectangle at (23, 120) with width 51 and height 105.
; PLAN: r0=23(x), r1=120(y), r2=51(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 120
LDI r2, 51
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
