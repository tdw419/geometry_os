; DESCRIPTION: Draws a red line from (182, 76) to (348, 124).
; PLAN: r0=182(x1), r1=76(y1), r2=348(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 76
LDI r2, 348
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
