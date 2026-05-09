; DESCRIPTION: Draws a white rectangle at (244, 108) with width 94 and height 84.
; PLAN: r0=244(x), r1=108(y), r2=94(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 108
LDI r2, 94
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
