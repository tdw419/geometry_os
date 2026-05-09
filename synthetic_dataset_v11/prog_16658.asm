; DESCRIPTION: Draws a yellow line from (29, 89) to (163, 111).
; PLAN: r0=29(x1), r1=89(y1), r2=163(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 89
LDI r2, 163
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
