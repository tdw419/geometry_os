; DESCRIPTION: Renders a orange box of size 26x101 starting at (214, 65).
; PLAN: r0=214(x), r1=65(y), r2=26(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 65
LDI r2, 26
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
