; DESCRIPTION: Places a purple line segment connecting (267, 106) to (222, 159).
; PLAN: r0=267(x1), r1=106(y1), r2=222(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 106
LDI r2, 222
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
