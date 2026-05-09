; DESCRIPTION: Renders a yellow line between points (31, 196) and (112, 200).
; PLAN: r0=31(x1), r1=196(y1), r2=112(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 196
LDI r2, 112
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
