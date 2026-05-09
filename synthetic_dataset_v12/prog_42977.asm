; DESCRIPTION: Places a yellow line segment connecting (335, 45) to (20, 99).
; PLAN: r0=335(x1), r1=45(y1), r2=20(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 45
LDI r2, 20
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
