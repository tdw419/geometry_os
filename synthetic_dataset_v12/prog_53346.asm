; DESCRIPTION: Draws a blue rectangle at (81, 179) with width 105 and height 12.
; PLAN: r0=81(x), r1=179(y), r2=105(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 179
LDI r2, 105
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
