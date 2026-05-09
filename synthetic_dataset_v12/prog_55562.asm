; DESCRIPTION: Draws a red line from (321, 74) to (149, 182).
; PLAN: r0=321(x1), r1=74(y1), r2=149(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 74
LDI r2, 149
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
