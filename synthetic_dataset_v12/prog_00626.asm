; DESCRIPTION: Draws a red line from (133, 6) to (415, 122).
; PLAN: r0=133(x1), r1=6(y1), r2=415(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 6
LDI r2, 415
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
