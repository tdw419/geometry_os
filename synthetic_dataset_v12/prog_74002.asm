; DESCRIPTION: Draws a green line from (393, 201) to (188, 238).
; PLAN: r0=393(x1), r1=201(y1), r2=188(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 201
LDI r2, 188
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
