; DESCRIPTION: Draws a white rectangle at (92, 105) with width 56 and height 66.
; PLAN: r0=92(x), r1=105(y), r2=56(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 105
LDI r2, 56
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
