; DESCRIPTION: Places a red line segment connecting (160, 14) to (133, 206).
; PLAN: r0=160(x1), r1=14(y1), r2=133(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 14
LDI r2, 133
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
