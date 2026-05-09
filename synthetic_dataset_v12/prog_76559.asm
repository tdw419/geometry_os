; DESCRIPTION: Places a green line segment connecting (194, 84) to (54, 220).
; PLAN: r0=194(x1), r1=84(y1), r2=54(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 84
LDI r2, 54
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
