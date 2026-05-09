; DESCRIPTION: Draws a white rectangle at (133, 88) with width 61 and height 79.
; PLAN: r0=133(x), r1=88(y), r2=61(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 88
LDI r2, 61
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
