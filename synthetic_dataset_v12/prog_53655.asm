; DESCRIPTION: Places a yellow line segment connecting (153, 219) to (32, 85).
; PLAN: r0=153(x1), r1=219(y1), r2=32(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 219
LDI r2, 32
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
