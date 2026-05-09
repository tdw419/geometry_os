; DESCRIPTION: Renders a magenta line between points (51, 170) and (199, 158).
; PLAN: r0=51(x1), r1=170(y1), r2=199(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 170
LDI r2, 199
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
