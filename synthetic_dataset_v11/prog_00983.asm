; DESCRIPTION: Places a black line segment connecting (149, 226) to (111, 132).
; PLAN: r0=149(x1), r1=226(y1), r2=111(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 226
LDI r2, 111
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
