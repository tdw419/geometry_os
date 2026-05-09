; DESCRIPTION: Places a blue line segment connecting (66, 13) to (24, 178).
; PLAN: r0=66(x1), r1=13(y1), r2=24(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 13
LDI r2, 24
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
