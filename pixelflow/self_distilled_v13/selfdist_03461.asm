; DESCRIPTION: Renders a orange rectangular region spanning 11 by 88 at (105, 78).
; PLAN: r0=105(x), r1=78(y), r2=11(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 78
LDI r2, 11
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
