; DESCRIPTION: Places a blue line segment connecting (128, 13) to (58, 248).
; PLAN: r0=128(x1), r1=13(y1), r2=58(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 13
LDI r2, 58
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
