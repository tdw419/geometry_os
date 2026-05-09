; DESCRIPTION: Places a black line segment connecting (461, 158) to (264, 57).
; PLAN: r0=461(x1), r1=158(y1), r2=264(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 158
LDI r2, 264
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
