; DESCRIPTION: Places a yellow line segment connecting (500, 63) to (157, 155).
; PLAN: r0=500(x1), r1=63(y1), r2=157(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 63
LDI r2, 157
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
