; DESCRIPTION: Places a blue line segment connecting (142, 63) to (208, 156).
; PLAN: r0=142(x1), r1=63(y1), r2=208(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 63
LDI r2, 208
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
