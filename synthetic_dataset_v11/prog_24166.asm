; DESCRIPTION: Draws a white rectangle at (148, 105) with width 20 and height 105.
; PLAN: r0=148(x), r1=105(y), r2=20(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 105
LDI r2, 20
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
