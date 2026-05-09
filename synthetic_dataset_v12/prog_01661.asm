; DESCRIPTION: Places a green line segment connecting (137, 228) to (357, 160).
; PLAN: r0=137(x1), r1=228(y1), r2=357(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 228
LDI r2, 357
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
