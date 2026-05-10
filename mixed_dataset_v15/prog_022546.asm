; DESCRIPTION: Draws a purple line from (289, 77) to (229, 82).
; PLAN: r0=289(x1), r1=77(y1), r2=229(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 77
LDI r2, 229
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
