; DESCRIPTION: Places a black line segment connecting (269, 138) to (2, 40).
; PLAN: r0=269(x1), r1=138(y1), r2=2(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 138
LDI r2, 2
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
