; DESCRIPTION: Places a black line segment connecting (21, 2) to (468, 29).
; PLAN: r0=21(x1), r1=2(y1), r2=468(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 2
LDI r2, 468
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
