; DESCRIPTION: Places a yellow line segment connecting (462, 156) to (186, 143).
; PLAN: r0=462(x1), r1=156(y1), r2=186(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 156
LDI r2, 186
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
