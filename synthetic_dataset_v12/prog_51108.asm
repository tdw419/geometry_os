; DESCRIPTION: Draws a green line from (100, 17) to (508, 185).
; PLAN: r0=100(x1), r1=17(y1), r2=508(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 17
LDI r2, 508
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
