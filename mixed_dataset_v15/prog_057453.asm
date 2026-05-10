; DESCRIPTION: Renders a black line between points (348, 80) and (208, 184).
; PLAN: r0=348(x1), r1=80(y1), r2=208(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 80
LDI r2, 208
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
