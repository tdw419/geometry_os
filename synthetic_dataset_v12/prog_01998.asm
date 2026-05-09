; DESCRIPTION: Places a black line segment connecting (170, 57) to (51, 151).
; PLAN: r0=170(x1), r1=57(y1), r2=51(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 57
LDI r2, 51
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
