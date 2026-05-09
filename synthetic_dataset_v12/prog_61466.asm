; DESCRIPTION: Draws a white rectangle at (80, 132) with width 108 and height 84.
; PLAN: r0=80(x), r1=132(y), r2=108(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 132
LDI r2, 108
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
