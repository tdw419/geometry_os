; DESCRIPTION: Places a red line segment connecting (278, 36) to (321, 188).
; PLAN: r0=278(x1), r1=36(y1), r2=321(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 36
LDI r2, 321
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
