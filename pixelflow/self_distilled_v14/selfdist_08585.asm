; DESCRIPTION: Renders a white rectangular region spanning 70 by 118 at (89, 118).
; PLAN: r0=89(x), r1=118(y), r2=70(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 118
LDI r2, 70
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
