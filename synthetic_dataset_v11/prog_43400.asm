; DESCRIPTION: Draws a red line from (74, 212) to (38, 223).
; PLAN: r0=74(x1), r1=212(y1), r2=38(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 212
LDI r2, 38
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
