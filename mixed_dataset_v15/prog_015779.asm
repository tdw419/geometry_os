; DESCRIPTION: Draws a black line from (201, 169) to (127, 55).
; PLAN: r0=201(x1), r1=169(y1), r2=127(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 169
LDI r2, 127
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
