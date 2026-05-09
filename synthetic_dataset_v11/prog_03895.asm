; DESCRIPTION: Places a black line segment connecting (17, 52) to (94, 253).
; PLAN: r0=17(x1), r1=52(y1), r2=94(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 52
LDI r2, 94
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
