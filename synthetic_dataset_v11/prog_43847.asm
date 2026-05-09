; DESCRIPTION: Places a red line segment connecting (181, 146) to (80, 175).
; PLAN: r0=181(x1), r1=146(y1), r2=80(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 146
LDI r2, 80
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
