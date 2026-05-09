; DESCRIPTION: Places a green line segment connecting (26, 247) to (248, 100).
; PLAN: r0=26(x1), r1=247(y1), r2=248(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 247
LDI r2, 248
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
