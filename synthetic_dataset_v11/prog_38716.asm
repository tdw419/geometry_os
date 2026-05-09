; DESCRIPTION: Places a black line segment connecting (238, 158) to (213, 127).
; PLAN: r0=238(x1), r1=158(y1), r2=213(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 158
LDI r2, 213
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
