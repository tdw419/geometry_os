; DESCRIPTION: Renders a orange box of size 81x97 starting at (14, 141).
; PLAN: r0=14(x), r1=141(y), r2=81(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 141
LDI r2, 81
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
