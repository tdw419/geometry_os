; DESCRIPTION: Places a green line segment connecting (227, 178) to (44, 162).
; PLAN: r0=227(x1), r1=178(y1), r2=44(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 178
LDI r2, 44
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
