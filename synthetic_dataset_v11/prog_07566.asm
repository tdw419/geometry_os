; DESCRIPTION: Draws a blue rectangle at (44, 235) with width 56 and height 17.
; PLAN: r0=44(x), r1=235(y), r2=56(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 235
LDI r2, 56
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
