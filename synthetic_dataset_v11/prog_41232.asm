; DESCRIPTION: Places a red line segment connecting (249, 240) to (194, 9).
; PLAN: r0=249(x1), r1=240(y1), r2=194(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 240
LDI r2, 194
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
