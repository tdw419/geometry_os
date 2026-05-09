; DESCRIPTION: Renders a magenta line between points (199, 202) and (201, 52).
; PLAN: r0=199(x1), r1=202(y1), r2=201(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 202
LDI r2, 201
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
