; DESCRIPTION: Renders a orange box of size 102x112 starting at (100, 89).
; PLAN: r0=100(x), r1=89(y), r2=102(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 89
LDI r2, 102
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
