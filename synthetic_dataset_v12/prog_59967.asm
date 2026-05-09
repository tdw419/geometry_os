; DESCRIPTION: Renders a yellow line between points (149, 71) and (67, 151).
; PLAN: r0=149(x1), r1=71(y1), r2=67(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 71
LDI r2, 67
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
