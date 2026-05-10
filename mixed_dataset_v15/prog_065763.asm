; DESCRIPTION: Places a blue line segment connecting (22, 228) to (355, 106).
; PLAN: r0=22(x1), r1=228(y1), r2=355(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 228
LDI r2, 355
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
