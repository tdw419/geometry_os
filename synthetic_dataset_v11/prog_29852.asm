; DESCRIPTION: Renders a orange box of size 10x101 starting at (43, 61).
; PLAN: r0=43(x), r1=61(y), r2=10(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 61
LDI r2, 10
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
