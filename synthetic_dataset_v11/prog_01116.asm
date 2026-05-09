; DESCRIPTION: Places a black line segment connecting (115, 55) to (102, 51).
; PLAN: r0=115(x1), r1=55(y1), r2=102(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 55
LDI r2, 102
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
