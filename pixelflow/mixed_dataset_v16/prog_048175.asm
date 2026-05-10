; DESCRIPTION: Renders a orange box of size 114x26 starting at (54, 141).
; PLAN: r0=54(x), r1=141(y), r2=114(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 141
LDI r2, 114
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
