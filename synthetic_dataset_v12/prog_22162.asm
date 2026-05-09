; DESCRIPTION: Places a red line segment connecting (117, 179) to (451, 248).
; PLAN: r0=117(x1), r1=179(y1), r2=451(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 179
LDI r2, 451
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
