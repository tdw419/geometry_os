; DESCRIPTION: Places a purple line segment connecting (208, 40) to (222, 146).
; PLAN: r0=208(x1), r1=40(y1), r2=222(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 40
LDI r2, 222
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
