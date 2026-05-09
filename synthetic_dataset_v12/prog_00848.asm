; DESCRIPTION: Places a yellow line segment connecting (71, 68) to (224, 135).
; PLAN: r0=71(x1), r1=68(y1), r2=224(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 68
LDI r2, 224
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
