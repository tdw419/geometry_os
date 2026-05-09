; DESCRIPTION: Draws a white rectangle at (19, 150) with width 99 and height 52.
; PLAN: r0=19(x), r1=150(y), r2=99(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 150
LDI r2, 99
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
