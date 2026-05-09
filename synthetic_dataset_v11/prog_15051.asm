; DESCRIPTION: Renders a orange box of size 100x102 starting at (118, 76).
; PLAN: r0=118(x), r1=76(y), r2=100(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 76
LDI r2, 100
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
