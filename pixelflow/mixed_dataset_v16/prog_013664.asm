; DESCRIPTION: Places a black line segment connecting (110, 28) to (432, 193).
; PLAN: r0=110(x1), r1=28(y1), r2=432(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 28
LDI r2, 432
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
