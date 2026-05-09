; DESCRIPTION: Places a black line segment connecting (29, 167) to (18, 162).
; PLAN: r0=29(x1), r1=167(y1), r2=18(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 167
LDI r2, 18
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
