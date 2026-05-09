; DESCRIPTION: Renders a magenta line between points (331, 119) and (376, 247).
; PLAN: r0=331(x1), r1=119(y1), r2=376(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 119
LDI r2, 376
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
