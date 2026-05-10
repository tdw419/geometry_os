; DESCRIPTION: Renders a orange box of size 112x13 starting at (83, 100).
; PLAN: r0=83(x), r1=100(y), r2=112(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 100
LDI r2, 112
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
