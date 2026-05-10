; DESCRIPTION: Renders a red rectangular region spanning 89 by 44 at (250, 112).
; PLAN: r0=250(x), r1=112(y), r2=89(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 112
LDI r2, 89
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
