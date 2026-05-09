; DESCRIPTION: Draws a yellow line from (142, 123) to (510, 80).
; PLAN: r0=142(x1), r1=123(y1), r2=510(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 123
LDI r2, 510
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
