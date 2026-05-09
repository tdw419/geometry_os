; DESCRIPTION: Places a red line segment connecting (132, 238) to (111, 211).
; PLAN: r0=132(x1), r1=238(y1), r2=111(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 238
LDI r2, 111
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
