; DESCRIPTION: Places a black line segment connecting (47, 53) to (201, 57).
; PLAN: r0=47(x1), r1=53(y1), r2=201(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 53
LDI r2, 201
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
