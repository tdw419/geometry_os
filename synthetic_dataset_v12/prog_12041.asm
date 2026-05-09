; DESCRIPTION: Renders a magenta line between points (437, 201) and (418, 150).
; PLAN: r0=437(x1), r1=201(y1), r2=418(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 201
LDI r2, 418
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
