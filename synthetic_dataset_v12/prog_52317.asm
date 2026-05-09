; DESCRIPTION: Draws a red line from (481, 47) to (318, 81).
; PLAN: r0=481(x1), r1=47(y1), r2=318(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 47
LDI r2, 318
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
