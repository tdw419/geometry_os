; DESCRIPTION: Places a black line segment connecting (453, 10) to (26, 165).
; PLAN: r0=453(x1), r1=10(y1), r2=26(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 10
LDI r2, 26
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
