; DESCRIPTION: Renders a orange rectangular region spanning 103 by 18 at (181, 45).
; PLAN: r0=181(x), r1=45(y), r2=103(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 45
LDI r2, 103
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
