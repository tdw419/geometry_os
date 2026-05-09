; DESCRIPTION: Renders a orange box of size 100x34 starting at (181, 189).
; PLAN: r0=181(x), r1=189(y), r2=100(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 189
LDI r2, 100
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
