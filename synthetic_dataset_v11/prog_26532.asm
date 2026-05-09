; DESCRIPTION: Draws a red line from (104, 48) to (95, 116).
; PLAN: r0=104(x1), r1=48(y1), r2=95(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 48
LDI r2, 95
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
