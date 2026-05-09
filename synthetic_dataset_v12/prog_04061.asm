; DESCRIPTION: Places a black line segment connecting (337, 218) to (471, 134).
; PLAN: r0=337(x1), r1=218(y1), r2=471(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 218
LDI r2, 471
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
