; DESCRIPTION: Draws a blue rectangle at (453, 125) with width 21 and height 116.
; PLAN: r0=453(x), r1=125(y), r2=21(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 125
LDI r2, 21
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
