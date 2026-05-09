; DESCRIPTION: Renders a orange box of size 56x19 starting at (194, 2).
; PLAN: r0=194(x), r1=2(y), r2=56(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 2
LDI r2, 56
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
