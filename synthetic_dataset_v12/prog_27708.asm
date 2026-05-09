; DESCRIPTION: Places a red line segment connecting (362, 17) to (338, 35).
; PLAN: r0=362(x1), r1=17(y1), r2=338(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 17
LDI r2, 338
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
