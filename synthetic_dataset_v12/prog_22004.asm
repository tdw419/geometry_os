; DESCRIPTION: Draws a green line from (98, 119) to (201, 197).
; PLAN: r0=98(x1), r1=119(y1), r2=201(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 119
LDI r2, 201
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
