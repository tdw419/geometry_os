; DESCRIPTION: Renders a orange rectangular region spanning 102 by 11 at (248, 43).
; PLAN: r0=248(x), r1=43(y), r2=102(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 43
LDI r2, 102
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
