; DESCRIPTION: Places a blue line segment connecting (410, 99) to (407, 66).
; PLAN: r0=410(x1), r1=99(y1), r2=407(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 99
LDI r2, 407
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
