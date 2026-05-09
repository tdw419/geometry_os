; DESCRIPTION: Places a black line segment connecting (463, 138) to (195, 136).
; PLAN: r0=463(x1), r1=138(y1), r2=195(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 138
LDI r2, 195
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
