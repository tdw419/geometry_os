; DESCRIPTION: Renders a orange box of size 53x106 starting at (131, 76).
; PLAN: r0=131(x), r1=76(y), r2=53(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 76
LDI r2, 53
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
