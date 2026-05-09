; DESCRIPTION: Draws a blue rectangle at (132, 70) with width 45 and height 116.
; PLAN: r0=132(x), r1=70(y), r2=45(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 70
LDI r2, 45
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
