; DESCRIPTION: Places a green line segment connecting (216, 2) to (383, 26).
; PLAN: r0=216(x1), r1=2(y1), r2=383(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 2
LDI r2, 383
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
