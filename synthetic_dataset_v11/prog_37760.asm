; DESCRIPTION: Places a yellow line segment connecting (130, 222) to (219, 141).
; PLAN: r0=130(x1), r1=222(y1), r2=219(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 222
LDI r2, 219
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
