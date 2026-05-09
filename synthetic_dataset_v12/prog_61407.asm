; DESCRIPTION: Draws a red line from (38, 116) to (206, 223).
; PLAN: r0=38(x1), r1=116(y1), r2=206(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 116
LDI r2, 206
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
