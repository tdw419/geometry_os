; DESCRIPTION: Places a black line segment connecting (115, 55) to (17, 71).
; PLAN: r0=115(x1), r1=55(y1), r2=17(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 55
LDI r2, 17
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
