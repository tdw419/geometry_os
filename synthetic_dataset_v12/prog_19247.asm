; DESCRIPTION: Places a blue line segment connecting (187, 89) to (269, 222).
; PLAN: r0=187(x1), r1=89(y1), r2=269(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 89
LDI r2, 269
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
