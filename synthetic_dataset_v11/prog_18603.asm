; DESCRIPTION: Draws a purple line from (113, 89) to (149, 111).
; PLAN: r0=113(x1), r1=89(y1), r2=149(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 89
LDI r2, 149
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
