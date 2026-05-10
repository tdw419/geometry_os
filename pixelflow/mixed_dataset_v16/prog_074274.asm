; DESCRIPTION: Renders a magenta line between points (451, 197) and (498, 201).
; PLAN: r0=451(x1), r1=197(y1), r2=498(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 197
LDI r2, 498
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
