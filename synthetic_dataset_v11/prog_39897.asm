; DESCRIPTION: Renders a orange box of size 81x118 starting at (63, 23).
; PLAN: r0=63(x), r1=23(y), r2=81(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 23
LDI r2, 81
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
