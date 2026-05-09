; DESCRIPTION: Places a purple line segment connecting (147, 242) to (224, 81).
; PLAN: r0=147(x1), r1=242(y1), r2=224(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 242
LDI r2, 224
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
