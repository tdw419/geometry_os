; DESCRIPTION: Places a purple line segment connecting (250, 117) to (239, 92).
; PLAN: r0=250(x1), r1=117(y1), r2=239(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 117
LDI r2, 239
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
