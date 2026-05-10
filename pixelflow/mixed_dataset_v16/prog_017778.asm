; DESCRIPTION: Draws a white rectangle at (17, 78) with width 77 and height 39.
; PLAN: r0=17(x), r1=78(y), r2=77(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 78
LDI r2, 77
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
