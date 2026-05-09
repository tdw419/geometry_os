; DESCRIPTION: Places a black line segment connecting (26, 237) to (8, 151).
; PLAN: r0=26(x1), r1=237(y1), r2=8(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 237
LDI r2, 8
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
