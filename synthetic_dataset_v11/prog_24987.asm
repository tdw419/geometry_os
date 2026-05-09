; DESCRIPTION: Places a cyan line segment connecting (63, 54) to (201, 78).
; PLAN: r0=63(x1), r1=54(y1), r2=201(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 54
LDI r2, 201
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
