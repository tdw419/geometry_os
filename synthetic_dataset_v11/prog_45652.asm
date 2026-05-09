; DESCRIPTION: Renders a yellow line between points (124, 137) and (203, 112).
; PLAN: r0=124(x1), r1=137(y1), r2=203(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 137
LDI r2, 203
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
