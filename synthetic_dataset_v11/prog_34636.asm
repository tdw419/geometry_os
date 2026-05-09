; DESCRIPTION: Places a blue line segment connecting (44, 50) to (204, 168).
; PLAN: r0=44(x1), r1=50(y1), r2=204(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 50
LDI r2, 204
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
