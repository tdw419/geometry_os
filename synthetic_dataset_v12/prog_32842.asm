; DESCRIPTION: Places a black line segment connecting (278, 162) to (233, 3).
; PLAN: r0=278(x1), r1=162(y1), r2=233(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 162
LDI r2, 233
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
