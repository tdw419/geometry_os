; DESCRIPTION: Places a white line segment connecting (439, 97) to (363, 188).
; PLAN: r0=439(x1), r1=97(y1), r2=363(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 97
LDI r2, 363
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
