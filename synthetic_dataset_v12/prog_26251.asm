; DESCRIPTION: Renders a cyan line between points (133, 112) and (463, 118).
; PLAN: r0=133(x1), r1=112(y1), r2=463(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 112
LDI r2, 463
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
