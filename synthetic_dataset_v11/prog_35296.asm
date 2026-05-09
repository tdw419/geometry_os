; DESCRIPTION: Places a black line segment connecting (188, 63) to (80, 181).
; PLAN: r0=188(x1), r1=63(y1), r2=80(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 63
LDI r2, 80
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
