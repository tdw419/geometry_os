; DESCRIPTION: Draws a red line from (128, 53) to (348, 81).
; PLAN: r0=128(x1), r1=53(y1), r2=348(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 53
LDI r2, 348
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
