; DESCRIPTION: Places a yellow line segment connecting (28, 115) to (501, 66).
; PLAN: r0=28(x1), r1=115(y1), r2=501(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 115
LDI r2, 501
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
