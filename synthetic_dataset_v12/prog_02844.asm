; DESCRIPTION: Draws a yellow line from (343, 26) to (163, 221).
; PLAN: r0=343(x1), r1=26(y1), r2=163(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 26
LDI r2, 163
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
