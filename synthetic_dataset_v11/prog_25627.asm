; DESCRIPTION: Places a purple line segment connecting (161, 116) to (31, 93).
; PLAN: r0=161(x1), r1=116(y1), r2=31(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 116
LDI r2, 31
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
