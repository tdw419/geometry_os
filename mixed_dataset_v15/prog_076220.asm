; DESCRIPTION: Places a magenta line segment connecting (442, 83) to (201, 106).
; PLAN: r0=442(x1), r1=83(y1), r2=201(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 83
LDI r2, 201
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
