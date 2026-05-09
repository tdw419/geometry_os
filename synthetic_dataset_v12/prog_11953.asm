; DESCRIPTION: Places a black line segment connecting (466, 149) to (221, 140).
; PLAN: r0=466(x1), r1=149(y1), r2=221(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 149
LDI r2, 221
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
