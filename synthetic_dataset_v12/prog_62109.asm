; DESCRIPTION: Places a green line segment connecting (22, 238) to (399, 97).
; PLAN: r0=22(x1), r1=238(y1), r2=399(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 238
LDI r2, 399
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
