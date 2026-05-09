; DESCRIPTION: Places a blue line segment connecting (62, 81) to (304, 68).
; PLAN: r0=62(x1), r1=81(y1), r2=304(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 81
LDI r2, 304
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
