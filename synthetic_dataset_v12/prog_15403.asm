; DESCRIPTION: Places a red line segment connecting (456, 240) to (157, 112).
; PLAN: r0=456(x1), r1=240(y1), r2=157(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 240
LDI r2, 157
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
