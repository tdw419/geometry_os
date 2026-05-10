; DESCRIPTION: Draws a red line from (70, 212) to (149, 254).
; PLAN: r0=70(x1), r1=212(y1), r2=149(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 212
LDI r2, 149
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
