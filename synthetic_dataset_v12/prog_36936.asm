; DESCRIPTION: Places a magenta line segment connecting (109, 200) to (104, 11).
; PLAN: r0=109(x1), r1=200(y1), r2=104(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 200
LDI r2, 104
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
