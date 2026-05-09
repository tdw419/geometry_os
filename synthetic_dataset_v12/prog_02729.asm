; DESCRIPTION: Renders a red line between points (187, 10) and (314, 114).
; PLAN: r0=187(x1), r1=10(y1), r2=314(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 10
LDI r2, 314
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
