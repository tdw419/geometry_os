; DESCRIPTION: Renders a orange rectangular region spanning 101 by 119 at (28, 112).
; PLAN: r0=28(x), r1=112(y), r2=101(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 112
LDI r2, 101
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
