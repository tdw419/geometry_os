; DESCRIPTION: Places a yellow line segment connecting (40, 63) to (153, 4).
; PLAN: r0=40(x1), r1=63(y1), r2=153(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 63
LDI r2, 153
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
