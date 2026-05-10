; DESCRIPTION: Draws a red line from (14, 56) to (334, 35).
; PLAN: r0=14(x1), r1=56(y1), r2=334(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 56
LDI r2, 334
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
