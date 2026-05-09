; DESCRIPTION: Renders a magenta line between points (124, 191) and (80, 79).
; PLAN: r0=124(x1), r1=191(y1), r2=80(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 191
LDI r2, 80
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
