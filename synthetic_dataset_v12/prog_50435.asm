; DESCRIPTION: Places a blue line segment connecting (61, 114) to (96, 138).
; PLAN: r0=61(x1), r1=114(y1), r2=96(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 114
LDI r2, 96
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
