; DESCRIPTION: Draws a blue rectangle at (63, 141) with width 15 and height 90.
; PLAN: r0=63(x), r1=141(y), r2=15(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 141
LDI r2, 15
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
