; DESCRIPTION: Places a blue line segment connecting (259, 138) to (233, 129).
; PLAN: r0=259(x1), r1=138(y1), r2=233(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 138
LDI r2, 233
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
