; DESCRIPTION: Places a yellow line segment connecting (224, 38) to (153, 141).
; PLAN: r0=224(x1), r1=38(y1), r2=153(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 38
LDI r2, 153
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
