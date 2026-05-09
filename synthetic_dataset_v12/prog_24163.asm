; DESCRIPTION: Renders a magenta line between points (172, 174) and (145, 218).
; PLAN: r0=172(x1), r1=174(y1), r2=145(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 174
LDI r2, 145
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
