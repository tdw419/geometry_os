; DESCRIPTION: Places a blue line segment connecting (287, 102) to (126, 99).
; PLAN: r0=287(x1), r1=102(y1), r2=126(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 102
LDI r2, 126
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
