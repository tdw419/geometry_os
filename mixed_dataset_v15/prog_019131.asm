; DESCRIPTION: Renders a red rectangular region spanning 41 by 101 at (69, 101).
; PLAN: r0=69(x), r1=101(y), r2=41(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 101
LDI r2, 41
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
