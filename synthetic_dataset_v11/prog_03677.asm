; DESCRIPTION: Places a black line segment connecting (106, 5) to (109, 153).
; PLAN: r0=106(x1), r1=5(y1), r2=109(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 5
LDI r2, 109
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
