; DESCRIPTION: Renders a orange box of size 26x31 starting at (102, 71).
; PLAN: r0=102(x), r1=71(y), r2=26(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 71
LDI r2, 26
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
