; DESCRIPTION: Places a yellow line segment connecting (333, 62) to (363, 248).
; PLAN: r0=333(x1), r1=62(y1), r2=363(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 62
LDI r2, 363
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
