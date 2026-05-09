; DESCRIPTION: Places a magenta line segment connecting (370, 85) to (388, 193).
; PLAN: r0=370(x1), r1=85(y1), r2=388(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 85
LDI r2, 388
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
