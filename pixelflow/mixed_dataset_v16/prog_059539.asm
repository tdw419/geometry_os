; DESCRIPTION: Draws a green line from (201, 140) to (249, 11).
; PLAN: r0=201(x1), r1=140(y1), r2=249(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 140
LDI r2, 249
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
