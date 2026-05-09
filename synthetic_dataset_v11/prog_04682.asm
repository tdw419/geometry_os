; DESCRIPTION: Draws a white rectangle at (44, 6) with width 116 and height 70.
; PLAN: r0=44(x), r1=6(y), r2=116(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 6
LDI r2, 116
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
