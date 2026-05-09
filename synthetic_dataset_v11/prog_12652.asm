; DESCRIPTION: Draws a red line from (153, 65) to (182, 133).
; PLAN: r0=153(x1), r1=65(y1), r2=182(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 65
LDI r2, 182
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
