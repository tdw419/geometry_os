; DESCRIPTION: Places a purple line segment connecting (267, 224) to (306, 184).
; PLAN: r0=267(x1), r1=224(y1), r2=306(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 224
LDI r2, 306
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
