; DESCRIPTION: Draws a red line from (62, 104) to (193, 110).
; PLAN: r0=62(x1), r1=104(y1), r2=193(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 104
LDI r2, 193
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
