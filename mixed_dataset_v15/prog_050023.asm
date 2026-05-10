; DESCRIPTION: Renders a red rectangular region spanning 85 by 118 at (106, 7).
; PLAN: r0=106(x), r1=7(y), r2=85(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 7
LDI r2, 85
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
