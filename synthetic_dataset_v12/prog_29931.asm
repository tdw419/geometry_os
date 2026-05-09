; DESCRIPTION: Draws a white rectangle at (424, 194) with width 25 and height 52.
; PLAN: r0=424(x), r1=194(y), r2=25(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 194
LDI r2, 25
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
