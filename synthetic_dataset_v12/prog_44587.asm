; DESCRIPTION: Draws a red line from (65, 70) to (428, 184).
; PLAN: r0=65(x1), r1=70(y1), r2=428(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 70
LDI r2, 428
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
