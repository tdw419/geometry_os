; DESCRIPTION: Draws a red line from (217, 221) to (116, 120).
; PLAN: r0=217(x1), r1=221(y1), r2=116(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 221
LDI r2, 116
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
