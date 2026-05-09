; DESCRIPTION: Renders a black line between points (458, 46) and (66, 151).
; PLAN: r0=458(x1), r1=46(y1), r2=66(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 46
LDI r2, 66
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
