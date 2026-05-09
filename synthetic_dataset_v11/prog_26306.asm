; DESCRIPTION: Renders a orange box of size 99x35 starting at (26, 181).
; PLAN: r0=26(x), r1=181(y), r2=99(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 181
LDI r2, 99
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
