; DESCRIPTION: Renders a red line between points (242, 89) and (121, 129).
; PLAN: r0=242(x1), r1=89(y1), r2=121(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 89
LDI r2, 121
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
