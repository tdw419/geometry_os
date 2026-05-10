; DESCRIPTION: Places a black line segment connecting (55, 70) to (334, 43).
; PLAN: r0=55(x1), r1=70(y1), r2=334(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 70
LDI r2, 334
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
