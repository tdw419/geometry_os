; DESCRIPTION: Places a purple line segment connecting (191, 56) to (239, 115).
; PLAN: r0=191(x1), r1=56(y1), r2=239(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 56
LDI r2, 239
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
