; DESCRIPTION: Places a yellow line segment connecting (484, 15) to (504, 38).
; PLAN: r0=484(x1), r1=15(y1), r2=504(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 15
LDI r2, 504
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
