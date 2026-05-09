; DESCRIPTION: Renders a orange box of size 77x118 starting at (37, 1).
; PLAN: r0=37(x), r1=1(y), r2=77(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 1
LDI r2, 77
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
