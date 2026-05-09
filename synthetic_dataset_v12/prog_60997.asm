; DESCRIPTION: Places a yellow line segment connecting (451, 93) to (252, 97).
; PLAN: r0=451(x1), r1=93(y1), r2=252(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 93
LDI r2, 252
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
