; DESCRIPTION: Places a black line segment connecting (468, 54) to (279, 1).
; PLAN: r0=468(x1), r1=54(y1), r2=279(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 54
LDI r2, 279
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
