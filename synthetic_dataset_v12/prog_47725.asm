; DESCRIPTION: Places a black line segment connecting (254, 180) to (34, 170).
; PLAN: r0=254(x1), r1=180(y1), r2=34(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 180
LDI r2, 34
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
