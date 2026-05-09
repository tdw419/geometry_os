; DESCRIPTION: Draws a blue rectangle at (249, 173) with width 105 and height 73.
; PLAN: r0=249(x), r1=173(y), r2=105(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 173
LDI r2, 105
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
