; DESCRIPTION: Places a yellow line segment connecting (62, 248) to (178, 81).
; PLAN: r0=62(x1), r1=248(y1), r2=178(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 248
LDI r2, 178
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
