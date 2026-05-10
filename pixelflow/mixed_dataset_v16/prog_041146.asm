; DESCRIPTION: Places a red line segment connecting (114, 15) to (315, 198).
; PLAN: r0=114(x1), r1=15(y1), r2=315(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 15
LDI r2, 315
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
