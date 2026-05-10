; DESCRIPTION: Draws a blue rectangle at (235, 13) with width 44 and height 92.
; PLAN: r0=235(x), r1=13(y), r2=44(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 13
LDI r2, 44
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
