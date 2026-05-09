; DESCRIPTION: Renders a green line between points (114, 179) and (172, 124).
; PLAN: r0=114(x1), r1=179(y1), r2=172(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 179
LDI r2, 172
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
