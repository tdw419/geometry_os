; DESCRIPTION: Renders a orange box of size 114x62 starting at (312, 35).
; PLAN: r0=312(x), r1=35(y), r2=114(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 35
LDI r2, 114
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
