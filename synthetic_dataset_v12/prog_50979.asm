; DESCRIPTION: Draws a yellow line from (458, 97) to (142, 106).
; PLAN: r0=458(x1), r1=97(y1), r2=142(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 97
LDI r2, 142
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
