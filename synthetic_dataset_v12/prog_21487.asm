; DESCRIPTION: Places a blue line segment connecting (193, 252) to (384, 22).
; PLAN: r0=193(x1), r1=252(y1), r2=384(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 252
LDI r2, 384
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
