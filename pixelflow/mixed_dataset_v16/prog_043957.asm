; DESCRIPTION: Places a magenta line segment connecting (233, 17) to (192, 119).
; PLAN: r0=233(x1), r1=17(y1), r2=192(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 17
LDI r2, 192
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
