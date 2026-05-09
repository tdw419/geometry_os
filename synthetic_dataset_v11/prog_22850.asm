; DESCRIPTION: Places a green line segment connecting (145, 56) to (38, 133).
; PLAN: r0=145(x1), r1=56(y1), r2=38(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 56
LDI r2, 38
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
