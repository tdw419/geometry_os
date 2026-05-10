; DESCRIPTION: Places a yellow line segment connecting (195, 100) to (427, 132).
; PLAN: r0=195(x1), r1=100(y1), r2=427(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 100
LDI r2, 427
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
