; DESCRIPTION: Places a black line segment connecting (253, 143) to (84, 99).
; PLAN: r0=253(x1), r1=143(y1), r2=84(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 143
LDI r2, 84
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
