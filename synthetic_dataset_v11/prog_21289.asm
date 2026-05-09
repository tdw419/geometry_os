; DESCRIPTION: Places a blue line segment connecting (60, 93) to (204, 108).
; PLAN: r0=60(x1), r1=93(y1), r2=204(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 93
LDI r2, 204
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
