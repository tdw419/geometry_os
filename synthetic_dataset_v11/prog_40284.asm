; DESCRIPTION: Places a blue line segment connecting (204, 207) to (107, 123).
; PLAN: r0=204(x1), r1=207(y1), r2=107(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 207
LDI r2, 107
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
