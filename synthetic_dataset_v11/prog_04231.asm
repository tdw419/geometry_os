; DESCRIPTION: Places a black line segment connecting (34, 57) to (115, 134).
; PLAN: r0=34(x1), r1=57(y1), r2=115(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 57
LDI r2, 115
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
