; DESCRIPTION: Renders a orange rectangular region spanning 24 by 115 at (7, 89).
; PLAN: r0=7(x), r1=89(y), r2=24(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 89
LDI r2, 24
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
