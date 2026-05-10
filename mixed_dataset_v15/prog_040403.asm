; DESCRIPTION: Places a green line segment connecting (251, 217) to (321, 63).
; PLAN: r0=251(x1), r1=217(y1), r2=321(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 217
LDI r2, 321
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
