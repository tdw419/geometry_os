; DESCRIPTION: Places a yellow line segment connecting (42, 229) to (110, 204).
; PLAN: r0=42(x1), r1=229(y1), r2=110(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 229
LDI r2, 110
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
