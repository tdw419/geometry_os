; DESCRIPTION: Renders a red line segment connecting (304, 167) to (41, 118).
; PLAN: r0=304(x1), r1=167(y1), r2=41(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 167
LDI r2, 41
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
