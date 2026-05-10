; DESCRIPTION: Places a red line segment connecting (315, 158) to (255, 127).
; PLAN: r0=315(x1), r1=158(y1), r2=255(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 158
LDI r2, 255
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
