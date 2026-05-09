; DESCRIPTION: Places a purple line segment connecting (360, 108) to (122, 138).
; PLAN: r0=360(x1), r1=108(y1), r2=122(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 108
LDI r2, 122
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
