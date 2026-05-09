; DESCRIPTION: Places a green line segment connecting (25, 129) to (484, 233).
; PLAN: r0=25(x1), r1=129(y1), r2=484(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 129
LDI r2, 484
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
