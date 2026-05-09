; DESCRIPTION: Draws a white rectangle at (283, 96) with width 89 and height 32.
; PLAN: r0=283(x), r1=96(y), r2=89(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 96
LDI r2, 89
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
