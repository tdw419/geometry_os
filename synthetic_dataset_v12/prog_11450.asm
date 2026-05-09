; DESCRIPTION: Places a green line segment connecting (389, 229) to (373, 165).
; PLAN: r0=389(x1), r1=229(y1), r2=373(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 229
LDI r2, 373
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
