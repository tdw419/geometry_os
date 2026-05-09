; DESCRIPTION: Places a black line segment connecting (75, 22) to (26, 33).
; PLAN: r0=75(x1), r1=22(y1), r2=26(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 22
LDI r2, 26
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
