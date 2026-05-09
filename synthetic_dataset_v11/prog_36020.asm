; DESCRIPTION: Places a black line segment connecting (140, 97) to (130, 111).
; PLAN: r0=140(x1), r1=97(y1), r2=130(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 97
LDI r2, 130
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
