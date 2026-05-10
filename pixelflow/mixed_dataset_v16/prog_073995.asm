; DESCRIPTION: Places a purple line segment connecting (267, 3) to (241, 70).
; PLAN: r0=267(x1), r1=3(y1), r2=241(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 3
LDI r2, 241
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
