; DESCRIPTION: Renders a orange box of size 23x85 starting at (459, 156).
; PLAN: r0=459(x), r1=156(y), r2=23(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 156
LDI r2, 23
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
