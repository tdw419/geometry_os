; DESCRIPTION: Draws a red line from (370, 84) to (389, 161).
; PLAN: r0=370(x1), r1=84(y1), r2=389(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 84
LDI r2, 389
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
