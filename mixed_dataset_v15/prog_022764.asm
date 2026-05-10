; DESCRIPTION: Places a magenta line segment connecting (372, 218) to (78, 254).
; PLAN: r0=372(x1), r1=218(y1), r2=78(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 218
LDI r2, 78
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
