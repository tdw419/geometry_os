; DESCRIPTION: Renders a magenta line between points (201, 197) and (163, 115).
; PLAN: r0=201(x1), r1=197(y1), r2=163(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 197
LDI r2, 163
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
