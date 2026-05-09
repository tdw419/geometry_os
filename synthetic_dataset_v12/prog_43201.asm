; DESCRIPTION: Places a magenta line segment connecting (355, 70) to (2, 192).
; PLAN: r0=355(x1), r1=70(y1), r2=2(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 70
LDI r2, 2
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
