; DESCRIPTION: Renders a orange box of size 26x36 starting at (26, 23).
; PLAN: r0=26(x), r1=23(y), r2=26(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 23
LDI r2, 26
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
