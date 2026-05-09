; DESCRIPTION: Places a purple line segment connecting (64, 61) to (239, 248).
; PLAN: r0=64(x1), r1=61(y1), r2=239(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 61
LDI r2, 239
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
