; DESCRIPTION: Places a red line segment connecting (85, 181) to (240, 96).
; PLAN: r0=85(x1), r1=181(y1), r2=240(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 181
LDI r2, 240
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
