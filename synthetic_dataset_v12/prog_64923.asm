; DESCRIPTION: Places a black line segment connecting (180, 184) to (34, 60).
; PLAN: r0=180(x1), r1=184(y1), r2=34(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 184
LDI r2, 34
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
