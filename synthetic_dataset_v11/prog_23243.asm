; DESCRIPTION: Draws a red line from (134, 250) to (57, 55).
; PLAN: r0=134(x1), r1=250(y1), r2=57(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 250
LDI r2, 57
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
