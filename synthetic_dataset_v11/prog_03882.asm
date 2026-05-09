; DESCRIPTION: Places a black line segment connecting (26, 113) to (221, 95).
; PLAN: r0=26(x1), r1=113(y1), r2=221(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 113
LDI r2, 221
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
