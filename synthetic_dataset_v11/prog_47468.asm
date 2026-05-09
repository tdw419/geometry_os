; DESCRIPTION: Renders a magenta line between points (62, 85) and (199, 31).
; PLAN: r0=62(x1), r1=85(y1), r2=199(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 85
LDI r2, 199
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
