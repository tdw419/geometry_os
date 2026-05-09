; DESCRIPTION: Draws a yellow line from (124, 95) to (248, 106).
; PLAN: r0=124(x1), r1=95(y1), r2=248(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 95
LDI r2, 248
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
