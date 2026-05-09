; DESCRIPTION: Places a green line segment connecting (233, 99) to (26, 233).
; PLAN: r0=233(x1), r1=99(y1), r2=26(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 99
LDI r2, 26
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
