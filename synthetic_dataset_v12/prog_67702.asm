; DESCRIPTION: Places a yellow line segment connecting (141, 187) to (484, 38).
; PLAN: r0=141(x1), r1=187(y1), r2=484(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 187
LDI r2, 484
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
