; DESCRIPTION: Places a yellow line segment connecting (321, 237) to (254, 84).
; PLAN: r0=321(x1), r1=237(y1), r2=254(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 237
LDI r2, 254
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
