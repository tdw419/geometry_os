; DESCRIPTION: Draws a white rectangle at (128, 119) with width 84 and height 79.
; PLAN: r0=128(x), r1=119(y), r2=84(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 119
LDI r2, 84
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
