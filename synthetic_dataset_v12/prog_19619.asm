; DESCRIPTION: Draws a white line from (484, 201) to (408, 65).
; PLAN: r0=484(x1), r1=201(y1), r2=408(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 201
LDI r2, 408
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
