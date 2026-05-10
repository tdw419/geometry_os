; DESCRIPTION: Renders a orange box of size 26x119 starting at (429, 65).
; PLAN: r0=429(x), r1=65(y), r2=26(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 65
LDI r2, 26
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
