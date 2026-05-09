; DESCRIPTION: Places a blue line segment connecting (98, 138) to (58, 151).
; PLAN: r0=98(x1), r1=138(y1), r2=58(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 138
LDI r2, 58
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
