; DESCRIPTION: Renders a magenta line between points (338, 201) and (429, 77).
; PLAN: r0=338(x1), r1=201(y1), r2=429(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 201
LDI r2, 429
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
