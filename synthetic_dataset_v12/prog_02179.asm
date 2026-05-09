; DESCRIPTION: Places a green line segment connecting (14, 115) to (36, 94).
; PLAN: r0=14(x1), r1=115(y1), r2=36(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 115
LDI r2, 36
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
