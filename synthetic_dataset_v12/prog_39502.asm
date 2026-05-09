; DESCRIPTION: Places a blue line segment connecting (414, 231) to (345, 223).
; PLAN: r0=414(x1), r1=231(y1), r2=345(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 231
LDI r2, 345
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
