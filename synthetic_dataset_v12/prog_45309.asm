; DESCRIPTION: Draws a blue rectangle at (273, 53) with width 29 and height 119.
; PLAN: r0=273(x), r1=53(y), r2=29(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 53
LDI r2, 29
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
