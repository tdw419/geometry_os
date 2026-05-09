; DESCRIPTION: Renders a green line between points (247, 115) and (129, 118).
; PLAN: r0=247(x1), r1=115(y1), r2=129(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 115
LDI r2, 129
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
