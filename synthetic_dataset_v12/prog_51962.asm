; DESCRIPTION: Places a black line segment connecting (112, 163) to (188, 128).
; PLAN: r0=112(x1), r1=163(y1), r2=188(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 163
LDI r2, 188
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
