; DESCRIPTION: Places a yellow line segment connecting (326, 189) to (347, 14).
; PLAN: r0=326(x1), r1=189(y1), r2=347(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 189
LDI r2, 347
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
