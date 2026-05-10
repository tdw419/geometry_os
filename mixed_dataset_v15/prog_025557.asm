; DESCRIPTION: Draws a blue rectangle at (253, 25) with width 66 and height 63.
; PLAN: r0=253(x), r1=25(y), r2=66(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 25
LDI r2, 66
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
