; DESCRIPTION: Draws a red line from (338, 81) to (434, 167).
; PLAN: r0=338(x1), r1=81(y1), r2=434(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 81
LDI r2, 434
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
