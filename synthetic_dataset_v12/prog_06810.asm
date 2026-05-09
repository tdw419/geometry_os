; DESCRIPTION: Places a magenta line segment connecting (500, 11) to (355, 54).
; PLAN: r0=500(x1), r1=11(y1), r2=355(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 11
LDI r2, 355
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
