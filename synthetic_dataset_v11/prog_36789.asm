; DESCRIPTION: Places a yellow line segment connecting (224, 36) to (157, 51).
; PLAN: r0=224(x1), r1=36(y1), r2=157(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 36
LDI r2, 157
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
