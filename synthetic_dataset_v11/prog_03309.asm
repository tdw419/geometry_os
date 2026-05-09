; DESCRIPTION: Places a green line segment connecting (124, 52) to (224, 170).
; PLAN: r0=124(x1), r1=52(y1), r2=224(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 52
LDI r2, 224
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
