; DESCRIPTION: Places a black line segment connecting (87, 38) to (51, 251).
; PLAN: r0=87(x1), r1=38(y1), r2=51(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 38
LDI r2, 51
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
