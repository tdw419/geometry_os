; DESCRIPTION: Draws a red line from (434, 135) to (246, 1).
; PLAN: r0=434(x1), r1=135(y1), r2=246(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 135
LDI r2, 246
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
