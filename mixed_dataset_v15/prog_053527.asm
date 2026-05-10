; DESCRIPTION: Draws a blue rectangle at (250, 185) with width 72 and height 70.
; PLAN: r0=250(x), r1=185(y), r2=72(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 185
LDI r2, 72
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
