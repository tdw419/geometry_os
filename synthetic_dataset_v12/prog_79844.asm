; DESCRIPTION: Renders a magenta line between points (378, 80) and (505, 143).
; PLAN: r0=378(x1), r1=80(y1), r2=505(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 80
LDI r2, 505
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
