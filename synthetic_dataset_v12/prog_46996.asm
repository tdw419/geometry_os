; DESCRIPTION: Places a black line segment connecting (401, 118) to (192, 93).
; PLAN: r0=401(x1), r1=118(y1), r2=192(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 118
LDI r2, 192
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
