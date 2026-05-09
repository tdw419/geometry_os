; DESCRIPTION: Places a yellow line segment connecting (115, 223) to (439, 36).
; PLAN: r0=115(x1), r1=223(y1), r2=439(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 223
LDI r2, 439
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
