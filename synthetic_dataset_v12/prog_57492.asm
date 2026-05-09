; DESCRIPTION: Places a yellow line segment connecting (89, 85) to (314, 42).
; PLAN: r0=89(x1), r1=85(y1), r2=314(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 85
LDI r2, 314
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
