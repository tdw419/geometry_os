; DESCRIPTION: Draws a white rectangle at (49, 44) with width 84 and height 96.
; PLAN: r0=49(x), r1=44(y), r2=84(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 44
LDI r2, 84
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
