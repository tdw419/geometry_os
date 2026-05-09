; DESCRIPTION: Renders a white line between points (94, 112) and (81, 118).
; PLAN: r0=94(x1), r1=112(y1), r2=81(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 112
LDI r2, 81
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
