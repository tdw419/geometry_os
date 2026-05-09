; DESCRIPTION: Places a green line segment connecting (101, 145) to (66, 23).
; PLAN: r0=101(x1), r1=145(y1), r2=66(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 145
LDI r2, 66
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
