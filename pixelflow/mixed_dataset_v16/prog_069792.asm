; DESCRIPTION: Renders a orange rectangular region spanning 89 by 39 at (158, 31).
; PLAN: r0=158(x), r1=31(y), r2=89(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 31
LDI r2, 89
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
