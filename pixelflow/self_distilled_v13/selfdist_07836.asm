; DESCRIPTION: Renders a orange rectangular region spanning 101 by 109 at (43, 58).
; PLAN: r0=43(x), r1=58(y), r2=101(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 58
LDI r2, 101
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
