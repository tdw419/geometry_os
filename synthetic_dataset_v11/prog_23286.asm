; DESCRIPTION: Places a yellow line segment connecting (191, 55) to (170, 151).
; PLAN: r0=191(x1), r1=55(y1), r2=170(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 55
LDI r2, 170
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
