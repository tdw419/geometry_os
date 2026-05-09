; DESCRIPTION: Places a blue line segment connecting (241, 85) to (129, 21).
; PLAN: r0=241(x1), r1=85(y1), r2=129(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 85
LDI r2, 129
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
