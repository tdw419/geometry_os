; DESCRIPTION: Renders a red line between points (430, 143) and (338, 98).
; PLAN: r0=430(x1), r1=143(y1), r2=338(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 143
LDI r2, 338
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
