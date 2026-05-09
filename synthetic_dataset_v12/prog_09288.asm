; DESCRIPTION: Draws a red line from (43, 76) to (430, 218).
; PLAN: r0=43(x1), r1=76(y1), r2=430(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 76
LDI r2, 430
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
