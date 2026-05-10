; DESCRIPTION: Places a blue line segment connecting (468, 103) to (391, 203).
; PLAN: r0=468(x1), r1=103(y1), r2=391(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 103
LDI r2, 391
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
