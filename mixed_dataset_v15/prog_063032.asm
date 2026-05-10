; DESCRIPTION: Draws a white rectangle at (399, 70) with width 28 and height 24.
; PLAN: r0=399(x), r1=70(y), r2=28(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 70
LDI r2, 28
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
