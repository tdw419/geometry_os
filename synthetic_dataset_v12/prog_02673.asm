; DESCRIPTION: Draws a yellow line from (351, 161) to (379, 111).
; PLAN: r0=351(x1), r1=161(y1), r2=379(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 161
LDI r2, 379
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
