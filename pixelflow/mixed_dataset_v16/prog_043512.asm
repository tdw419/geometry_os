; DESCRIPTION: Places a yellow line segment connecting (453, 234) to (68, 224).
; PLAN: r0=453(x1), r1=234(y1), r2=68(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 234
LDI r2, 68
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
