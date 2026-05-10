; DESCRIPTION: Places a purple line segment connecting (367, 120) to (391, 227).
; PLAN: r0=367(x1), r1=120(y1), r2=391(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 120
LDI r2, 391
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
