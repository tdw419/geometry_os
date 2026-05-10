; DESCRIPTION: Draws a white rectangle at (161, 76) with width 94 and height 84.
; PLAN: r0=161(x), r1=76(y), r2=94(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 76
LDI r2, 94
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
