; DESCRIPTION: Draws a red line from (116, 214) to (182, 179).
; PLAN: r0=116(x1), r1=214(y1), r2=182(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 214
LDI r2, 182
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
