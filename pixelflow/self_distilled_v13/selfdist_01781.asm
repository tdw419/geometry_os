; DESCRIPTION: Renders a white rectangular region spanning 99 by 74 at (312, 97).
; PLAN: r0=312(x), r1=97(y), r2=99(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 97
LDI r2, 99
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
