; DESCRIPTION: Renders a white line between points (318, 72) and (351, 111).
; PLAN: r0=318(x1), r1=72(y1), r2=351(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 72
LDI r2, 351
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
