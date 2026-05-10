; DESCRIPTION: Draws a black line from (468, 211) to (484, 204).
; PLAN: r0=468(x1), r1=211(y1), r2=484(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 211
LDI r2, 484
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
