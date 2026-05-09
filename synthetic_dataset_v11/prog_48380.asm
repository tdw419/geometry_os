; DESCRIPTION: Places a green line segment connecting (1, 40) to (44, 91).
; PLAN: r0=1(x1), r1=40(y1), r2=44(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 40
LDI r2, 44
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
