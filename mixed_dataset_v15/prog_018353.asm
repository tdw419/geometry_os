; DESCRIPTION: Renders a magenta line between points (127, 201) and (423, 6).
; PLAN: r0=127(x1), r1=201(y1), r2=423(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 201
LDI r2, 423
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
