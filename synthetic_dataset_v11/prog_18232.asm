; DESCRIPTION: Places a yellow line segment connecting (109, 237) to (188, 248).
; PLAN: r0=109(x1), r1=237(y1), r2=188(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 237
LDI r2, 188
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
