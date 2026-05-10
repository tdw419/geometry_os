; DESCRIPTION: Draws a black line from (427, 200) to (463, 10).
; PLAN: r0=427(x1), r1=200(y1), r2=463(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 200
LDI r2, 463
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
