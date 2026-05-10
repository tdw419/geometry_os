; DESCRIPTION: Draws a white rectangle at (283, 6) with width 62 and height 33.
; PLAN: r0=283(x), r1=6(y), r2=62(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 6
LDI r2, 62
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
