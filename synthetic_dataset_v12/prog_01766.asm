; DESCRIPTION: Renders a green line between points (506, 41) and (169, 137).
; PLAN: r0=506(x1), r1=41(y1), r2=169(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 41
LDI r2, 169
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
