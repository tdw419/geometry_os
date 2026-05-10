; DESCRIPTION: Places a yellow line segment connecting (382, 1) to (498, 175).
; PLAN: r0=382(x1), r1=1(y1), r2=498(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 1
LDI r2, 498
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
