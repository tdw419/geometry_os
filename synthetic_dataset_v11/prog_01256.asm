; DESCRIPTION: Renders a magenta line between points (18, 25) and (199, 185).
; PLAN: r0=18(x1), r1=25(y1), r2=199(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 25
LDI r2, 199
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
