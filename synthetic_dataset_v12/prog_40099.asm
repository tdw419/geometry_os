; DESCRIPTION: Places a yellow line segment connecting (128, 70) to (144, 17).
; PLAN: r0=128(x1), r1=70(y1), r2=144(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 70
LDI r2, 144
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
