; DESCRIPTION: Places a red line segment connecting (237, 192) to (439, 61).
; PLAN: r0=237(x1), r1=192(y1), r2=439(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 192
LDI r2, 439
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
