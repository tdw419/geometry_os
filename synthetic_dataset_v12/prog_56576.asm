; DESCRIPTION: Draws a white rectangle at (293, 56) with width 110 and height 64.
; PLAN: r0=293(x), r1=56(y), r2=110(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 56
LDI r2, 110
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
