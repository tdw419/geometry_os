; DESCRIPTION: Draws a red line from (149, 70) to (149, 87).
; PLAN: r0=149(x1), r1=70(y1), r2=149(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 70
LDI r2, 149
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
