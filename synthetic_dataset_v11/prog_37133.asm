; DESCRIPTION: Places a yellow line segment connecting (48, 155) to (144, 240).
; PLAN: r0=48(x1), r1=155(y1), r2=144(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 155
LDI r2, 144
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
