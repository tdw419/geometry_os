; DESCRIPTION: Draws a white rectangle at (253, 1) with width 38 and height 101.
; PLAN: r0=253(x), r1=1(y), r2=38(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 1
LDI r2, 38
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
