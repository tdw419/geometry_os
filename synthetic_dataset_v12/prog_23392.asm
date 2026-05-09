; DESCRIPTION: Places a purple line segment connecting (138, 28) to (18, 123).
; PLAN: r0=138(x1), r1=28(y1), r2=18(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 28
LDI r2, 18
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
