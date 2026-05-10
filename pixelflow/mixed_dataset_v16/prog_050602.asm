; DESCRIPTION: Draws a white line from (147, 112) to (378, 214).
; PLAN: r0=147(x1), r1=112(y1), r2=378(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 112
LDI r2, 378
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
