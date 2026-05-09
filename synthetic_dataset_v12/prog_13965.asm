; DESCRIPTION: Places a green line segment connecting (424, 251) to (219, 133).
; PLAN: r0=424(x1), r1=251(y1), r2=219(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 251
LDI r2, 219
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
