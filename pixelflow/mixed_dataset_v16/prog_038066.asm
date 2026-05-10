; DESCRIPTION: Renders a orange box of size 56x88 starting at (107, 78).
; PLAN: r0=107(x), r1=78(y), r2=56(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 78
LDI r2, 56
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
