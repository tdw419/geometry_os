; DESCRIPTION: Places a black line segment connecting (163, 23) to (243, 44).
; PLAN: r0=163(x1), r1=23(y1), r2=243(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 23
LDI r2, 243
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
