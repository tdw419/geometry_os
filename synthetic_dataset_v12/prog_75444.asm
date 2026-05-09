; DESCRIPTION: Places a green line segment connecting (229, 200) to (341, 70).
; PLAN: r0=229(x1), r1=200(y1), r2=341(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 200
LDI r2, 341
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
