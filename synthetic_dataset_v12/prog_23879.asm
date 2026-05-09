; DESCRIPTION: Places a blue line segment connecting (86, 241) to (401, 129).
; PLAN: r0=86(x1), r1=241(y1), r2=401(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 241
LDI r2, 401
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
