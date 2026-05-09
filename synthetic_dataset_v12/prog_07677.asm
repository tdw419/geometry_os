; DESCRIPTION: Places a green line segment connecting (273, 188) to (194, 102).
; PLAN: r0=273(x1), r1=188(y1), r2=194(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 188
LDI r2, 194
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
