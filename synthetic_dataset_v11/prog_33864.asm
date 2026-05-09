; DESCRIPTION: Renders a black line between points (11, 170) and (249, 151).
; PLAN: r0=11(x1), r1=170(y1), r2=249(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 170
LDI r2, 249
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
