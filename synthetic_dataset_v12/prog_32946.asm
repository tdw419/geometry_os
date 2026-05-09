; DESCRIPTION: Places a black line segment connecting (238, 98) to (360, 89).
; PLAN: r0=238(x1), r1=98(y1), r2=360(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 98
LDI r2, 360
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
