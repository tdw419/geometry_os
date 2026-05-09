; DESCRIPTION: Places a green line segment connecting (224, 117) to (172, 250).
; PLAN: r0=224(x1), r1=117(y1), r2=172(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 117
LDI r2, 172
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
