; DESCRIPTION: Renders a red line between points (253, 170) and (121, 114).
; PLAN: r0=253(x1), r1=170(y1), r2=121(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 170
LDI r2, 121
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
