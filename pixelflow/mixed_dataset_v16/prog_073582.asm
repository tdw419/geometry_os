; DESCRIPTION: Places a green line segment connecting (45, 224) to (271, 129).
; PLAN: r0=45(x1), r1=224(y1), r2=271(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 224
LDI r2, 271
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
