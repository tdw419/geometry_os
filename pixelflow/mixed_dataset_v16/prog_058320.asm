; DESCRIPTION: Renders a orange box of size 74x89 starting at (217, 110).
; PLAN: r0=217(x), r1=110(y), r2=74(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 110
LDI r2, 74
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
