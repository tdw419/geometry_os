; DESCRIPTION: Renders a yellow line between points (245, 3) and (138, 112).
; PLAN: r0=245(x1), r1=3(y1), r2=138(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 3
LDI r2, 138
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
