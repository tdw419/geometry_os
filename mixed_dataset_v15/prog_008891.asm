; DESCRIPTION: Draws a white rectangle at (219, 134) with width 52 and height 45.
; PLAN: r0=219(x), r1=134(y), r2=52(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 134
LDI r2, 52
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
