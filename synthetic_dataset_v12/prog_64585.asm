; DESCRIPTION: Renders a orange box of size 89x101 starting at (282, 109).
; PLAN: r0=282(x), r1=109(y), r2=89(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 109
LDI r2, 89
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
