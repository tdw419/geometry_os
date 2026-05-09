; DESCRIPTION: Places a black line segment connecting (267, 9) to (466, 203).
; PLAN: r0=267(x1), r1=9(y1), r2=466(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 9
LDI r2, 466
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
