; DESCRIPTION: Places a purple line segment connecting (142, 91) to (120, 187).
; PLAN: r0=142(x1), r1=91(y1), r2=120(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 91
LDI r2, 120
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
