; DESCRIPTION: Places a red line segment connecting (37, 222) to (363, 128).
; PLAN: r0=37(x1), r1=222(y1), r2=363(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 222
LDI r2, 363
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
