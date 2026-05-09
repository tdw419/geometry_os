; DESCRIPTION: Places a yellow line segment connecting (224, 161) to (110, 221).
; PLAN: r0=224(x1), r1=161(y1), r2=110(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 161
LDI r2, 110
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
