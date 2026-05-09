; DESCRIPTION: Places a yellow line segment connecting (59, 136) to (45, 114).
; PLAN: r0=59(x1), r1=136(y1), r2=45(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 136
LDI r2, 45
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
