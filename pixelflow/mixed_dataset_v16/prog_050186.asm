; DESCRIPTION: Places a purple line segment connecting (66, 119) to (293, 46).
; PLAN: r0=66(x1), r1=119(y1), r2=293(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 119
LDI r2, 293
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
