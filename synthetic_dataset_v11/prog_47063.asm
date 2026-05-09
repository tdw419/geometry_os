; DESCRIPTION: Places a blue line segment connecting (181, 31) to (227, 91).
; PLAN: r0=181(x1), r1=31(y1), r2=227(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 31
LDI r2, 227
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
