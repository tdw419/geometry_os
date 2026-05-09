; DESCRIPTION: Places a white line segment connecting (93, 189) to (53, 39).
; PLAN: r0=93(x1), r1=189(y1), r2=53(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 189
LDI r2, 53
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
