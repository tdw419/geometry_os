; DESCRIPTION: Places a black line segment connecting (105, 240) to (206, 140).
; PLAN: r0=105(x1), r1=240(y1), r2=206(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 240
LDI r2, 206
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
