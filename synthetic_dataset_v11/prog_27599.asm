; DESCRIPTION: Places a yellow line segment connecting (249, 164) to (201, 197).
; PLAN: r0=249(x1), r1=164(y1), r2=201(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 164
LDI r2, 201
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
