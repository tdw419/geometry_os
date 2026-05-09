; DESCRIPTION: Places a magenta line segment connecting (355, 191) to (10, 18).
; PLAN: r0=355(x1), r1=191(y1), r2=10(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 191
LDI r2, 10
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
