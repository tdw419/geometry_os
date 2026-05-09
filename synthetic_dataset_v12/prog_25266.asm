; DESCRIPTION: Draws a white line from (423, 22) to (251, 80).
; PLAN: r0=423(x1), r1=22(y1), r2=251(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 22
LDI r2, 251
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
