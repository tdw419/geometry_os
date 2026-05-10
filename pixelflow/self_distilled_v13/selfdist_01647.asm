; DESCRIPTION: Renders a blue line segment connecting (218, 123) to (378, 187).
; PLAN: r0=218(x1), r1=123(y1), r2=378(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 123
LDI r2, 378
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
