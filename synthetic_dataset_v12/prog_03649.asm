; DESCRIPTION: Places a yellow line segment connecting (79, 148) to (51, 99).
; PLAN: r0=79(x1), r1=148(y1), r2=51(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 148
LDI r2, 51
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
