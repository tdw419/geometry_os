; DESCRIPTION: Draws a blue rectangle at (127, 53) with width 119 and height 65.
; PLAN: r0=127(x), r1=53(y), r2=119(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 53
LDI r2, 119
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
