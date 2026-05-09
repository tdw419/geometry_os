; DESCRIPTION: Draws a white rectangle at (102, 43) with width 20 and height 78.
; PLAN: r0=102(x), r1=43(y), r2=20(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 43
LDI r2, 20
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
