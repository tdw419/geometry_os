; DESCRIPTION: Places a red line segment connecting (287, 55) to (36, 230).
; PLAN: r0=287(x1), r1=55(y1), r2=36(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 55
LDI r2, 36
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
