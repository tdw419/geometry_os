; DESCRIPTION: Places a blue line segment connecting (46, 123) to (33, 237).
; PLAN: r0=46(x1), r1=123(y1), r2=33(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 123
LDI r2, 33
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
