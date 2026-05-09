; DESCRIPTION: Draws a black line from (458, 180) to (348, 100).
; PLAN: r0=458(x1), r1=180(y1), r2=348(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 180
LDI r2, 348
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
