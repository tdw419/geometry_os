; DESCRIPTION: Draws a white rectangle at (203, 13) with width 22 and height 77.
; PLAN: r0=203(x), r1=13(y), r2=22(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 13
LDI r2, 22
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
