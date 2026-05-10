; DESCRIPTION: Draws a white rectangle at (121, 56) with width 12 and height 99.
; PLAN: r0=121(x), r1=56(y), r2=12(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 56
LDI r2, 12
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
