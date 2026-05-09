; DESCRIPTION: Draws a black line from (183, 140) to (163, 169).
; PLAN: r0=183(x1), r1=140(y1), r2=163(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 140
LDI r2, 163
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
