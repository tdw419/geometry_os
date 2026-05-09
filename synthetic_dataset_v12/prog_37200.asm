; DESCRIPTION: Draws a green line from (351, 109) to (341, 54).
; PLAN: r0=351(x1), r1=109(y1), r2=341(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 109
LDI r2, 341
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
