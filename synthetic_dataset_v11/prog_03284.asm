; DESCRIPTION: Renders a yellow line between points (179, 202) and (142, 229).
; PLAN: r0=179(x1), r1=202(y1), r2=142(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 202
LDI r2, 142
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
