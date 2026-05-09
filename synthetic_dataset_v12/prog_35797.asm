; DESCRIPTION: Draws a red line from (120, 34) to (74, 182).
; PLAN: r0=120(x1), r1=34(y1), r2=74(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 34
LDI r2, 74
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
