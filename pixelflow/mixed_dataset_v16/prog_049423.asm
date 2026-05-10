; DESCRIPTION: Places a yellow line segment connecting (21, 223) to (24, 155).
; PLAN: r0=21(x1), r1=223(y1), r2=24(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 223
LDI r2, 24
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
