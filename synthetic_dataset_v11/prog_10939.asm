; DESCRIPTION: Places a black line segment connecting (191, 23) to (224, 117).
; PLAN: r0=191(x1), r1=23(y1), r2=224(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 23
LDI r2, 224
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
