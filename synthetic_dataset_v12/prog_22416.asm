; DESCRIPTION: Places a magenta line segment connecting (360, 216) to (322, 98).
; PLAN: r0=360(x1), r1=216(y1), r2=322(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 216
LDI r2, 322
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
