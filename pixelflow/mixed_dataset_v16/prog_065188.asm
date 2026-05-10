; DESCRIPTION: Places a yellow line segment connecting (19, 139) to (301, 127).
; PLAN: r0=19(x1), r1=139(y1), r2=301(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 139
LDI r2, 301
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
