; DESCRIPTION: Renders a magenta line between points (141, 112) and (203, 7).
; PLAN: r0=141(x1), r1=112(y1), r2=203(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 112
LDI r2, 203
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
