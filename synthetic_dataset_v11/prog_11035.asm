; DESCRIPTION: Draws a blue rectangle at (63, 133) with width 65 and height 90.
; PLAN: r0=63(x), r1=133(y), r2=65(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 133
LDI r2, 65
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
