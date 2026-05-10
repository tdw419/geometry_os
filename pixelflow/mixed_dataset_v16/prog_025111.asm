; DESCRIPTION: Places a yellow line segment connecting (491, 7) to (350, 101).
; PLAN: r0=491(x1), r1=7(y1), r2=350(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 7
LDI r2, 350
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
