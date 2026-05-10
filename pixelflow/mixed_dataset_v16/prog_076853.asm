; DESCRIPTION: Places a yellow line segment connecting (471, 16) to (493, 220).
; PLAN: r0=471(x1), r1=16(y1), r2=493(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 16
LDI r2, 493
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
