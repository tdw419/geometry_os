; DESCRIPTION: Places a black line segment connecting (457, 240) to (113, 66).
; PLAN: r0=457(x1), r1=240(y1), r2=113(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 240
LDI r2, 113
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
