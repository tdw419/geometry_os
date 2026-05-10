; DESCRIPTION: Renders a orange rectangular region spanning 88 by 39 at (68, 114).
; PLAN: r0=68(x), r1=114(y), r2=88(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 114
LDI r2, 88
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
