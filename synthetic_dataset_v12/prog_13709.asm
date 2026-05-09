; DESCRIPTION: Renders a red line between points (311, 25) and (34, 104).
; PLAN: r0=311(x1), r1=25(y1), r2=34(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 25
LDI r2, 34
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
