; DESCRIPTION: Places a black line segment connecting (315, 35) to (361, 142).
; PLAN: r0=315(x1), r1=35(y1), r2=361(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 35
LDI r2, 361
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
