; DESCRIPTION: Places a purple line segment connecting (38, 67) to (229, 168).
; PLAN: r0=38(x1), r1=67(y1), r2=229(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 67
LDI r2, 229
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
