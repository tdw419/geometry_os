; DESCRIPTION: Places a green line segment connecting (508, 153) to (170, 216).
; PLAN: r0=508(x1), r1=153(y1), r2=170(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 153
LDI r2, 170
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
