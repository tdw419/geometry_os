; DESCRIPTION: Renders a orange box of size 71x106 starting at (181, 8).
; PLAN: r0=181(x), r1=8(y), r2=71(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 8
LDI r2, 71
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
