; DESCRIPTION: Places a yellow line segment connecting (109, 224) to (133, 239).
; PLAN: r0=109(x1), r1=224(y1), r2=133(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 224
LDI r2, 133
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
