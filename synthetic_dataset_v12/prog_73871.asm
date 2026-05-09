; DESCRIPTION: Draws a red line from (19, 43) to (360, 133).
; PLAN: r0=19(x1), r1=43(y1), r2=360(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 43
LDI r2, 360
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
