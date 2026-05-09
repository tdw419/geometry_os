; DESCRIPTION: Places a magenta line segment connecting (87, 68) to (204, 80).
; PLAN: r0=87(x1), r1=68(y1), r2=204(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 68
LDI r2, 204
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
