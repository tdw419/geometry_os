; DESCRIPTION: Places a purple line segment connecting (239, 61) to (304, 6).
; PLAN: r0=239(x1), r1=61(y1), r2=304(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 61
LDI r2, 304
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
