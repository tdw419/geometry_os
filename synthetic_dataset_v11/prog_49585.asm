; DESCRIPTION: Draws a white rectangle at (58, 155) with width 105 and height 79.
; PLAN: r0=58(x), r1=155(y), r2=105(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 155
LDI r2, 105
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
