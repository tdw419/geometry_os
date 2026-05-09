; DESCRIPTION: Places a yellow line segment connecting (511, 21) to (86, 61).
; PLAN: r0=511(x1), r1=21(y1), r2=86(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 21
LDI r2, 86
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
