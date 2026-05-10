; DESCRIPTION: Draws a purple rectangle at (1, 112) with width 113 and height 51.
; PLAN: r0=1(x), r1=112(y), r2=113(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 112
LDI r2, 113
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
