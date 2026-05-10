; DESCRIPTION: Draws a white rectangle at (15, 2) with width 77 and height 70.
; PLAN: r0=15(x), r1=2(y), r2=77(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 2
LDI r2, 77
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
