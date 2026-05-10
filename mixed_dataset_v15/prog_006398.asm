; DESCRIPTION: Places a white line segment connecting (383, 51) to (55, 99).
; PLAN: r0=383(x1), r1=51(y1), r2=55(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 51
LDI r2, 55
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
