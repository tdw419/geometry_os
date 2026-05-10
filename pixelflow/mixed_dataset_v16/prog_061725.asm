; DESCRIPTION: Places a yellow line segment connecting (210, 224) to (97, 11).
; PLAN: r0=210(x1), r1=224(y1), r2=97(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 224
LDI r2, 97
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
