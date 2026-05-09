; DESCRIPTION: Draws a white rectangle at (25, 7) with width 18 and height 115.
; PLAN: r0=25(x), r1=7(y), r2=18(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 7
LDI r2, 18
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
