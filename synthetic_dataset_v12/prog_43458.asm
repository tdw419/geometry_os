; DESCRIPTION: Places a green line segment connecting (132, 63) to (312, 188).
; PLAN: r0=132(x1), r1=63(y1), r2=312(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 63
LDI r2, 312
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
