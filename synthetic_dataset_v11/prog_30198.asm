; DESCRIPTION: Renders a orange box of size 107x118 starting at (28, 102).
; PLAN: r0=28(x), r1=102(y), r2=107(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 102
LDI r2, 107
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
