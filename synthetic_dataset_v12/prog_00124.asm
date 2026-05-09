; DESCRIPTION: Places a green line segment connecting (457, 229) to (36, 50).
; PLAN: r0=457(x1), r1=229(y1), r2=36(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 229
LDI r2, 36
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
