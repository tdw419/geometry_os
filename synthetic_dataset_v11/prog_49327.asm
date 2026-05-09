; DESCRIPTION: Places a green line segment connecting (189, 45) to (224, 150).
; PLAN: r0=189(x1), r1=45(y1), r2=224(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 45
LDI r2, 224
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
