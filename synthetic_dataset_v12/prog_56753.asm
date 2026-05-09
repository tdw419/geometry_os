; DESCRIPTION: Places a black line segment connecting (296, 236) to (260, 111).
; PLAN: r0=296(x1), r1=236(y1), r2=260(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 236
LDI r2, 260
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
