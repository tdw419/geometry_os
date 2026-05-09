; DESCRIPTION: Renders a purple line between points (38, 213) and (108, 151).
; PLAN: r0=38(x1), r1=213(y1), r2=108(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 213
LDI r2, 108
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
