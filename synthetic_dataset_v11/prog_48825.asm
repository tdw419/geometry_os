; DESCRIPTION: Places a purple line segment connecting (204, 129) to (146, 35).
; PLAN: r0=204(x1), r1=129(y1), r2=146(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 129
LDI r2, 146
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
