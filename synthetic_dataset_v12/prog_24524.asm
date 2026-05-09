; DESCRIPTION: Renders a magenta line between points (323, 254) and (472, 247).
; PLAN: r0=323(x1), r1=254(y1), r2=472(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 254
LDI r2, 472
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
