; DESCRIPTION: Places a purple line segment connecting (267, 183) to (496, 234).
; PLAN: r0=267(x1), r1=183(y1), r2=496(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 183
LDI r2, 496
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
