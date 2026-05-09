; DESCRIPTION: Places a yellow line segment connecting (199, 186) to (63, 130).
; PLAN: r0=199(x1), r1=186(y1), r2=63(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 186
LDI r2, 63
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
