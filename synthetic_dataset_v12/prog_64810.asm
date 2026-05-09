; DESCRIPTION: Renders a red line between points (204, 106) and (170, 46).
; PLAN: r0=204(x1), r1=106(y1), r2=170(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 106
LDI r2, 170
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
