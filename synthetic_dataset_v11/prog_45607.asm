; DESCRIPTION: Draws a red line from (62, 66) to (134, 55).
; PLAN: r0=62(x1), r1=66(y1), r2=134(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 66
LDI r2, 134
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
