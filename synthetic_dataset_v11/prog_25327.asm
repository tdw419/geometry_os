; DESCRIPTION: Draws a white rectangle at (96, 20) with width 85 and height 18.
; PLAN: r0=96(x), r1=20(y), r2=85(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 20
LDI r2, 85
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
