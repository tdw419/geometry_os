; DESCRIPTION: Places a black line segment connecting (98, 10) to (4, 4).
; PLAN: r0=98(x1), r1=10(y1), r2=4(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 10
LDI r2, 4
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
