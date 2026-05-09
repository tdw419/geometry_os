; DESCRIPTION: Draws a white rectangle at (289, 180) with width 31 and height 62.
; PLAN: r0=289(x), r1=180(y), r2=31(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 180
LDI r2, 31
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
