; DESCRIPTION: Places a yellow line segment connecting (144, 86) to (70, 83).
; PLAN: r0=144(x1), r1=86(y1), r2=70(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 86
LDI r2, 70
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
