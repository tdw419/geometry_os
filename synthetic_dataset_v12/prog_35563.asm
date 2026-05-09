; DESCRIPTION: Renders a black line between points (379, 123) and (428, 251).
; PLAN: r0=379(x1), r1=123(y1), r2=428(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 123
LDI r2, 428
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
