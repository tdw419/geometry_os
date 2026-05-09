; DESCRIPTION: Places a yellow line segment connecting (175, 224) to (283, 155).
; PLAN: r0=175(x1), r1=224(y1), r2=283(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 224
LDI r2, 283
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
