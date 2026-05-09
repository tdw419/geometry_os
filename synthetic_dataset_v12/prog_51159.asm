; DESCRIPTION: Places a blue line segment connecting (433, 114) to (326, 227).
; PLAN: r0=433(x1), r1=114(y1), r2=326(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 114
LDI r2, 326
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
