; DESCRIPTION: Draws a blue rectangle at (235, 81) with width 19 and height 36.
; PLAN: r0=235(x), r1=81(y), r2=19(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 81
LDI r2, 19
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
