; DESCRIPTION: Renders a orange rectangular region spanning 25 by 101 at (103, 66).
; PLAN: r0=103(x), r1=66(y), r2=25(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 66
LDI r2, 25
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
