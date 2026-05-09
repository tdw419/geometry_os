; DESCRIPTION: Places a black line segment connecting (260, 162) to (181, 240).
; PLAN: r0=260(x1), r1=162(y1), r2=181(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 162
LDI r2, 181
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
