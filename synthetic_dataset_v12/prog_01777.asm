; DESCRIPTION: Draws a red line from (441, 181) to (40, 131).
; PLAN: r0=441(x1), r1=181(y1), r2=40(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 181
LDI r2, 40
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
