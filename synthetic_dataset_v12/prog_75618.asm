; DESCRIPTION: Draws a blue rectangle at (121, 63) with width 65 and height 66.
; PLAN: r0=121(x), r1=63(y), r2=65(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 63
LDI r2, 65
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
