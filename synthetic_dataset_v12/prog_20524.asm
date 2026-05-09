; DESCRIPTION: Renders a yellow line between points (191, 112) and (159, 202).
; PLAN: r0=191(x1), r1=112(y1), r2=159(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 112
LDI r2, 159
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
