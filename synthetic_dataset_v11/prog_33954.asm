; DESCRIPTION: Places a purple line segment connecting (61, 189) to (75, 7).
; PLAN: r0=61(x1), r1=189(y1), r2=75(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 189
LDI r2, 75
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
