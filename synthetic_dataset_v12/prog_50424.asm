; DESCRIPTION: Renders a red line between points (348, 20) and (499, 241).
; PLAN: r0=348(x1), r1=20(y1), r2=499(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 20
LDI r2, 499
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
