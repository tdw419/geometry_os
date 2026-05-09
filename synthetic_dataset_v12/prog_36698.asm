; DESCRIPTION: Places a yellow line segment connecting (261, 187) to (89, 219).
; PLAN: r0=261(x1), r1=187(y1), r2=89(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 187
LDI r2, 89
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
