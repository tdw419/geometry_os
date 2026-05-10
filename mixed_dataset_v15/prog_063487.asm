; DESCRIPTION: Draws a blue rectangle at (249, 37) with width 81 and height 56.
; PLAN: r0=249(x), r1=37(y), r2=81(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 37
LDI r2, 81
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
