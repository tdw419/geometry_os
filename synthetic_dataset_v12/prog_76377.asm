; DESCRIPTION: Places a red line segment connecting (378, 234) to (336, 205).
; PLAN: r0=378(x1), r1=234(y1), r2=336(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 234
LDI r2, 336
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
