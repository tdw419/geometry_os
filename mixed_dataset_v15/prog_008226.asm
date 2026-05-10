; DESCRIPTION: Draws a white rectangle at (219, 149) with width 105 and height 19.
; PLAN: r0=219(x), r1=149(y), r2=105(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 149
LDI r2, 105
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
