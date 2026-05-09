; DESCRIPTION: Places a white line segment connecting (464, 169) to (137, 111).
; PLAN: r0=464(x1), r1=169(y1), r2=137(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 169
LDI r2, 137
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
