; DESCRIPTION: Places a purple line segment connecting (119, 84) to (267, 249).
; PLAN: r0=119(x1), r1=84(y1), r2=267(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 84
LDI r2, 267
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
