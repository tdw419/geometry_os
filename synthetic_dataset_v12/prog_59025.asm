; DESCRIPTION: Draws a red line from (496, 200) to (497, 169).
; PLAN: r0=496(x1), r1=200(y1), r2=497(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 200
LDI r2, 497
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
