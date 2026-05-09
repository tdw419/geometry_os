; DESCRIPTION: Places a black line segment connecting (490, 251) to (480, 44).
; PLAN: r0=490(x1), r1=251(y1), r2=480(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 251
LDI r2, 480
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
