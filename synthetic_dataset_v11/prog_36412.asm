; DESCRIPTION: Renders a orange box of size 81x105 starting at (140, 102).
; PLAN: r0=140(x), r1=102(y), r2=81(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 102
LDI r2, 81
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
