; DESCRIPTION: Renders a magenta line between points (109, 34) and (83, 196).
; PLAN: r0=109(x1), r1=34(y1), r2=83(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 34
LDI r2, 83
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
