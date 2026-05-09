; DESCRIPTION: Places a yellow line segment connecting (420, 244) to (471, 78).
; PLAN: r0=420(x1), r1=244(y1), r2=471(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 244
LDI r2, 471
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
