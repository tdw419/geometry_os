; DESCRIPTION: Places a purple line segment connecting (91, 65) to (175, 91).
; PLAN: r0=91(x1), r1=65(y1), r2=175(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 65
LDI r2, 175
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
