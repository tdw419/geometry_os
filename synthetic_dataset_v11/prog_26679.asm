; DESCRIPTION: Draws a purple rectangle at (21, 235) with width 48 and height 21.
; PLAN: r0=21(x), r1=235(y), r2=48(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 235
LDI r2, 48
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
