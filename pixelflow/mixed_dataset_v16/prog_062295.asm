; DESCRIPTION: Places a black line segment connecting (130, 140) to (505, 87).
; PLAN: r0=130(x1), r1=140(y1), r2=505(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 140
LDI r2, 505
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
