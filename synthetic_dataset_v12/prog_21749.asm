; DESCRIPTION: Places a magenta line segment connecting (293, 68) to (124, 22).
; PLAN: r0=293(x1), r1=68(y1), r2=124(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 68
LDI r2, 124
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
