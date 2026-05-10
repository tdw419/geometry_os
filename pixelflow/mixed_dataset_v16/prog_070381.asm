; DESCRIPTION: Places a yellow line segment connecting (349, 160) to (511, 60).
; PLAN: r0=349(x1), r1=160(y1), r2=511(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 160
LDI r2, 511
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
