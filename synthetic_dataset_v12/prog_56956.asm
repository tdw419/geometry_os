; DESCRIPTION: Places a black line segment connecting (138, 193) to (181, 123).
; PLAN: r0=138(x1), r1=193(y1), r2=181(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 193
LDI r2, 181
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
