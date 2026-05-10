; DESCRIPTION: Places a blue line segment connecting (327, 116) to (31, 114).
; PLAN: r0=327(x1), r1=116(y1), r2=31(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 116
LDI r2, 31
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
