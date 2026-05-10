; DESCRIPTION: Draws a white line from (391, 227) to (147, 206).
; PLAN: r0=391(x1), r1=227(y1), r2=147(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 227
LDI r2, 147
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
