; DESCRIPTION: Draws a white rectangle at (134, 96) with width 22 and height 25.
; PLAN: r0=134(x), r1=96(y), r2=22(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 96
LDI r2, 22
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
