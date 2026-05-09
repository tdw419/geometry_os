; DESCRIPTION: Places a purple line segment connecting (226, 33) to (30, 29).
; PLAN: r0=226(x1), r1=33(y1), r2=30(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 33
LDI r2, 30
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
