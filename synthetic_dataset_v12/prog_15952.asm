; DESCRIPTION: Draws a white rectangle at (399, 2) with width 79 and height 117.
; PLAN: r0=399(x), r1=2(y), r2=79(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 2
LDI r2, 79
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
