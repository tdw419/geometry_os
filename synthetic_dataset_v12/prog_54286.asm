; DESCRIPTION: Places a red line segment connecting (234, 118) to (8, 255).
; PLAN: r0=234(x1), r1=118(y1), r2=8(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 118
LDI r2, 8
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
