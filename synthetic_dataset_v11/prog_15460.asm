; DESCRIPTION: Places a black line segment connecting (196, 153) to (223, 140).
; PLAN: r0=196(x1), r1=153(y1), r2=223(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 153
LDI r2, 223
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
