; DESCRIPTION: Places a yellow line segment connecting (189, 241) to (323, 168).
; PLAN: r0=189(x1), r1=241(y1), r2=323(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 241
LDI r2, 323
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
