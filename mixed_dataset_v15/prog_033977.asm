; DESCRIPTION: Draws a white rectangle at (471, 46) with width 29 and height 85.
; PLAN: r0=471(x), r1=46(y), r2=29(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 46
LDI r2, 29
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
