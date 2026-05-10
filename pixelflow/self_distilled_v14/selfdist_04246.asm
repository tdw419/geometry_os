; DESCRIPTION: Renders a orange rectangular region spanning 106 by 89 at (251, 46).
; PLAN: r0=251(x), r1=46(y), r2=106(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 46
LDI r2, 106
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
