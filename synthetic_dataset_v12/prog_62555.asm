; DESCRIPTION: Places a yellow line segment connecting (320, 218) to (62, 56).
; PLAN: r0=320(x1), r1=218(y1), r2=62(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 218
LDI r2, 62
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
