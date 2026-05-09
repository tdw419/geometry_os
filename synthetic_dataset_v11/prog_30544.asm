; DESCRIPTION: Places a red line segment connecting (224, 155) to (166, 65).
; PLAN: r0=224(x1), r1=155(y1), r2=166(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 155
LDI r2, 166
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
