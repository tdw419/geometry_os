; DESCRIPTION: Places a yellow line segment connecting (365, 166) to (201, 206).
; PLAN: r0=365(x1), r1=166(y1), r2=201(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 166
LDI r2, 201
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
