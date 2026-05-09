; DESCRIPTION: Places a black line segment connecting (252, 246) to (323, 59).
; PLAN: r0=252(x1), r1=246(y1), r2=323(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 246
LDI r2, 323
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
