; DESCRIPTION: Draws a green line from (372, 171) to (351, 147).
; PLAN: r0=372(x1), r1=171(y1), r2=351(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 171
LDI r2, 351
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
