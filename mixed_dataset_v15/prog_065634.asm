; DESCRIPTION: Renders a yellow line between points (133, 43) and (90, 124).
; PLAN: r0=133(x1), r1=43(y1), r2=90(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 43
LDI r2, 90
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
