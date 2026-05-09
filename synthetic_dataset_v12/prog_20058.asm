; DESCRIPTION: Draws a yellow line from (389, 47) to (463, 207).
; PLAN: r0=389(x1), r1=47(y1), r2=463(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 47
LDI r2, 463
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
