; DESCRIPTION: Places a purple line segment connecting (78, 91) to (198, 132).
; PLAN: r0=78(x1), r1=91(y1), r2=198(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 91
LDI r2, 198
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
