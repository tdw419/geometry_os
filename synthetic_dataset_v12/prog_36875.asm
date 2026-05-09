; DESCRIPTION: Places a purple line segment connecting (350, 146) to (329, 163).
; PLAN: r0=350(x1), r1=146(y1), r2=329(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 146
LDI r2, 329
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
