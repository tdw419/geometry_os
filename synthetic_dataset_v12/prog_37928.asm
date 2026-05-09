; DESCRIPTION: Draws a red line from (289, 219) to (408, 217).
; PLAN: r0=289(x1), r1=219(y1), r2=408(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 219
LDI r2, 408
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
