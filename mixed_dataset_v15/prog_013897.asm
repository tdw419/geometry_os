; DESCRIPTION: Renders a yellow line segment connecting (301, 40) to (244, 151).
; PLAN: r0=301(x1), r1=40(y1), r2=244(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 40
LDI r2, 244
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
