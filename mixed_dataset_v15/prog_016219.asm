; DESCRIPTION: Places a yellow line segment connecting (64, 193) to (77, 90).
; PLAN: r0=64(x1), r1=193(y1), r2=77(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 193
LDI r2, 77
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
