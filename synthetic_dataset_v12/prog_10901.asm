; DESCRIPTION: Places a yellow line segment connecting (350, 174) to (190, 220).
; PLAN: r0=350(x1), r1=174(y1), r2=190(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 174
LDI r2, 190
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
