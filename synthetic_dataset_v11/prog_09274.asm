; DESCRIPTION: Draws a yellow line from (251, 112) to (163, 165).
; PLAN: r0=251(x1), r1=112(y1), r2=163(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 112
LDI r2, 163
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
