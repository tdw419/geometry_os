; DESCRIPTION: Places a green line segment connecting (50, 61) to (147, 12).
; PLAN: r0=50(x1), r1=61(y1), r2=147(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 61
LDI r2, 147
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
