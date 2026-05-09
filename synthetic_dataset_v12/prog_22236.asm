; DESCRIPTION: Renders a yellow line between points (358, 169) and (291, 151).
; PLAN: r0=358(x1), r1=169(y1), r2=291(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 169
LDI r2, 291
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
