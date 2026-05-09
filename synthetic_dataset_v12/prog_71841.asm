; DESCRIPTION: Draws a white rectangle at (74, 84) with width 90 and height 77.
; PLAN: r0=74(x), r1=84(y), r2=90(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 84
LDI r2, 90
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
