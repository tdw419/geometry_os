; DESCRIPTION: Places a yellow line segment connecting (181, 201) to (479, 130).
; PLAN: r0=181(x1), r1=201(y1), r2=479(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 201
LDI r2, 479
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
