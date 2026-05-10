; DESCRIPTION: Renders a orange rectangular region spanning 29 by 81 at (47, 69).
; PLAN: r0=47(x), r1=69(y), r2=29(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 69
LDI r2, 29
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
