; DESCRIPTION: Draws a white line from (93, 190) to (121, 95).
; PLAN: r0=93(x1), r1=190(y1), r2=121(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 190
LDI r2, 121
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
