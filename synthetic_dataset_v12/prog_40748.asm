; DESCRIPTION: Places a purple line segment connecting (267, 98) to (269, 160).
; PLAN: r0=267(x1), r1=98(y1), r2=269(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 98
LDI r2, 269
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
