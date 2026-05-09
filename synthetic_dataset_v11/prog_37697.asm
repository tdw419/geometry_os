; DESCRIPTION: Places a black line segment connecting (111, 97) to (86, 123).
; PLAN: r0=111(x1), r1=97(y1), r2=86(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 97
LDI r2, 86
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
