; DESCRIPTION: Places a yellow line segment connecting (224, 186) to (170, 119).
; PLAN: r0=224(x1), r1=186(y1), r2=170(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 186
LDI r2, 170
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
