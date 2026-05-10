; DESCRIPTION: Renders a orange rectangular region spanning 89 by 74 at (184, 44).
; PLAN: r0=184(x), r1=44(y), r2=89(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 44
LDI r2, 89
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
