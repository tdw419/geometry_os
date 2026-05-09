; DESCRIPTION: Renders a magenta line between points (15, 191) and (503, 137).
; PLAN: r0=15(x1), r1=191(y1), r2=503(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 191
LDI r2, 503
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
