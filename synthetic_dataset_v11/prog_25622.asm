; DESCRIPTION: Places a green line segment connecting (11, 37) to (110, 102).
; PLAN: r0=11(x1), r1=37(y1), r2=110(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 37
LDI r2, 110
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
