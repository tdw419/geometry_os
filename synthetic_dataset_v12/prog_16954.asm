; DESCRIPTION: Places a yellow line segment connecting (363, 44) to (473, 11).
; PLAN: r0=363(x1), r1=44(y1), r2=473(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 44
LDI r2, 473
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
