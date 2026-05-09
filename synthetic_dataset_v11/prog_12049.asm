; DESCRIPTION: Places a red line segment connecting (127, 238) to (90, 105).
; PLAN: r0=127(x1), r1=238(y1), r2=90(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 238
LDI r2, 90
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
